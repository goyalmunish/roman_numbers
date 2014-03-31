require_relative '../spec_helper'

module RomanNumbers
  describe RomanNumber do # EXAMPLE GROUP
    before(:each) do
      @roman_number = RomanNumber.new(1)
    end
    describe '#largest_repeatable_element' do
      it 'works for "3999" as input' do
        output = @roman_number.largest_repeatable_element(3999)
        output.should == {:reduced_integer => 999, :largest_element => {:unit => :M, :value => 1000}, :times => 3}
      end
      it 'works for "1066" as input' do
        output = @roman_number.largest_repeatable_element(1066)
        output.should == {:reduced_integer => 66, :largest_element => {:unit => :M, :value => 1000}, :times => 1}
      end
      it 'works for "207" as input' do
        output = @roman_number.largest_repeatable_element(207)
        output.should == {:reduced_integer => 7, :largest_element => {:unit => :C, :value => 100}, :times => 2}
      end
      it 'works for "10" as input' do
        output = @roman_number.largest_repeatable_element(10)
        output.should == {:reduced_integer => 0, :largest_element => {:unit => :X, :value => 10}, :times => 1}
      end
      it 'raises StartsWithNonRepeatableRomanUnitError for 999 as input' do
        expect {
          @roman_number.largest_repeatable_element(999)
        }.to raise_error(StartsWithNonRepeatableRomanUnitError)
      end
      it 'raises StartsWithNonRepeatableRomanUnitError for 44 as input' do
        expect {
          @roman_number.largest_repeatable_element(44)
        }.to raise_error(StartsWithNonRepeatableRomanUnitError)
      end
    end

    describe '#largest_non_repeatable_element' do
      before(:each) do
        @roman_number = RomanNumber.new(1)
      end
      it 'works for "999" as input' do
        output = @roman_number.largest_non_repeatable_element(999)
        output.should == {:reduced_integer => 99, :largest_element => {:unit => :CM, :value => 900}, :times => 1}
      end
      it 'works for "900" as input' do
        output = @roman_number.largest_non_repeatable_element(900)
        output.should == {:reduced_integer => 0, :largest_element => {:unit => :CM, :value => 900}, :times => 1}
      end
      it 'works for "44" as input' do
        output = @roman_number.largest_non_repeatable_element(44)
        output.should == {:reduced_integer => 4, :largest_element => {:unit => :XL, :value => 40}, :times => 1}
      end
      it 'works for "49" as input' do
        output = @roman_number.largest_non_repeatable_element(49)
        output.should == {:reduced_integer => 9, :largest_element => {:unit => :XL, :value => 40}, :times => 1}
      end
    end

    describe '#convert_arabic_to_roman' do
      context 'For Very Simple Integers' do
        it 'returns I for 1' do
          RomanNumber.new(1).convert_decimal_to_roman.should == 'I'
        end
        it 'returns V for 5' do
          RomanNumber.new(5).convert_decimal_to_roman.should == 'V'
        end
        it 'returns X for 10' do
          RomanNumber.new(10).convert_decimal_to_roman.should == 'X'
        end
        it 'returns L for 50' do
          RomanNumber.new(50).convert_decimal_to_roman.should == 'L'
        end
        it 'returns C for 100' do
          RomanNumber.new(100).convert_decimal_to_roman.should == 'C'
        end
        it 'returns D for 500' do
          RomanNumber.new(500).convert_decimal_to_roman.should == 'D'
        end
        it 'returns M for 1000' do
          RomanNumber.new(1000).convert_decimal_to_roman.should == 'M'
        end
      end
      context 'For Simple Integers' do
        it 'returns IV for 4' do
          RomanNumber.new(4).convert_decimal_to_roman.should == 'IV'
        end
        it 'returns IX for 9' do
          RomanNumber.new(9).convert_decimal_to_roman.should == 'IX'
        end
        it 'returns XL for 40' do
          RomanNumber.new(40).convert_decimal_to_roman.should == 'XL'
        end
        it 'returns XC for 90' do
          RomanNumber.new(90).convert_decimal_to_roman.should == 'XC'
        end
        it 'returns CD for 400' do
          RomanNumber.new(400).convert_decimal_to_roman.should == 'CD'
        end
        it 'returns CM for 900' do
          RomanNumber.new(900).convert_decimal_to_roman.should == 'CM'
        end
        it 'returns CCVII for 207' do
          RomanNumber.new(207).convert_decimal_to_roman.should == 'CCVII'
        end
        it 'returns MLXVI for 1066' do
          RomanNumber.new(1066).convert_decimal_to_roman.should == 'MLXVI'
        end
      end
      context 'For Complex Integers' do
        it 'returns XLIV for 44' do
          RomanNumber.new(44).convert_decimal_to_roman.should == 'XLIV'
        end
        it 'returns XLIX for 49' do
          RomanNumber.new(49).convert_decimal_to_roman.should == 'XLIX'
        end
        it 'returns CMIV for 904' do
          RomanNumber.new(904).convert_decimal_to_roman.should == 'CMIV'
        end
        it 'returns CMXLIV for 944' do
          RomanNumber.new(944).convert_decimal_to_roman.should == 'CMXLIV'
        end
        it 'returns MCMIV for 1904' do
          RomanNumber.new(1904).convert_decimal_to_roman.should == 'MCMIV'
        end
        it 'returns MCMXLIV for 1944' do
          RomanNumber.new(1944).convert_decimal_to_roman.should == 'MCMXLIV'
        end
      end
      context 'For Very Simple Integers' do
        it 'returns MMMCMXCIX for 3999' do
          RomanNumber.new(3999).convert_decimal_to_roman.should == 'MMMCMXCIX'
        end
      end
      context 'For Invalid Input' do
        it 'raises InvalidInputError for 4000 as input' do
          expect {
            RomanNumber.new(4000).convert_decimal_to_roman
          }.to raise_error(InvalidInputError)
        end
        it 'raises InvalidInputError for 0 as input' do
          expect {
            RomanNumber.new(0).convert_decimal_to_roman
          }.to raise_error(InvalidInputError)
        end
        it 'raises InvalidInputError for -10 as input' do
          expect {
            RomanNumber.new(-10).convert_decimal_to_roman
          }.to raise_error(InvalidInputError)
        end
        it 'raises InvalidInputError for "10" as input' do
          expect {
            RomanNumber.new('10').convert_decimal_to_roman
          }.to raise_error(InvalidInputError)
        end
      end
    end

    describe '#convert_roman_to_arabic' do
      context 'For Simple Romans' do
        it 'returns 1 for I' do
          RomanNumber.new('I').convert_roman_to_decimal.should == 1
        end
        it 'returns 5 for V' do
          RomanNumber.new('V').convert_roman_to_decimal.should == 5
        end
        it 'returns 10 for X' do
          RomanNumber.new('X').convert_roman_to_decimal.should == 10
        end
        it 'returns 50 for L' do
          RomanNumber.new('L').convert_roman_to_decimal.should == 50
        end
        it 'returns 100 for C' do
          RomanNumber.new('C').convert_roman_to_decimal.should == 100
        end
        it 'returns 500 for D' do
          RomanNumber.new('D').convert_roman_to_decimal.should == 500
        end
        it 'returns 1000 for M' do
          RomanNumber.new('M').convert_roman_to_decimal.should == 1000
        end
        it 'returns 4 for IV' do
          RomanNumber.new('IV').convert_roman_to_decimal.should == 4
        end
        it 'returns 9 for IX' do
          RomanNumber.new('IX').convert_roman_to_decimal.should == 9
        end
        it 'returns 40 for XL' do
          RomanNumber.new('XL').convert_roman_to_decimal.should == 40
        end
        it 'returns 90 for XC' do
          RomanNumber.new('XC').convert_roman_to_decimal.should == 90
        end
        it 'returns 400 for CD' do
          RomanNumber.new('CD').convert_roman_to_decimal.should == 400
        end
        it 'returns 900 for CM' do
          RomanNumber.new('CM').convert_roman_to_decimal.should == 900
        end
      end
      context 'For Complex Romans' do
        it 'returns 207 for CCVII' do
          RomanNumber.new('CCVII').convert_roman_to_decimal.should == 207
        end
        it 'returns 1066 for MLXVI' do
          RomanNumber.new('MLXVI').convert_roman_to_decimal.should == 1066
        end
        it 'returns 44 for XLIV' do
          RomanNumber.new('XLIV').convert_roman_to_decimal.should == 44
        end
        it 'returns 49 for XLIX' do
          RomanNumber.new('XLIX').convert_roman_to_decimal.should == 49
        end
        it 'returns 904 for CMIV' do
          RomanNumber.new('CMIV').convert_roman_to_decimal.should == 904
        end
        it 'returns 944 for CMXLIV' do
          RomanNumber.new('CMXLIV').convert_roman_to_decimal.should == 944
        end
        it 'returns 1904 for MCMIV' do
          RomanNumber.new('MCMIV').convert_roman_to_decimal.should == 1904
        end
        it 'returns 1944 for MCMXLIV' do
          RomanNumber.new('MCMXLIV').convert_roman_to_decimal.should == 1944
        end
        it 'returns 30 for XXX' do
          RomanNumber.new('XXX').convert_roman_to_decimal.should == 30
        end
        it 'returns 3999 for MMMCMXCIX' do
          RomanNumber.new('MMMCMXCIX').convert_roman_to_decimal.should == 3999
        end
      end
      context 'For Invalid Input' do
        it 'raises InvalidInputError for ABCDE as input' do
          expect {
            RomanNumber.new('ABCDE').convert_roman_to_decimal
          }.to raise_error(InvalidInputError)
        end
        it 'raises InvalidInputError for CCCCVII as input' do
          expect {
            RomanNumber.new('CCCCVII').convert_roman_to_decimal
          }.to raise_error(InvalidInputError)
        end
        it 'raises InvalidInputError for CCVVVVI as input' do
          expect {
            RomanNumber.new('CCVVVVI').convert_roman_to_decimal
          }.to raise_error(InvalidInputError)
        end
      end
    end
  end
end

