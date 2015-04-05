require_relative '../spec_helper'

module RomanNumbers
  describe RomanNumber do # EXAMPLE GROUP

    before(:each) do
      @roman_number = RomanNumber.new(1)
    end
    
    describe '#convert_arabic_to_roman' do
      context 'For Valid Input' do
        Helpers.valid_inputs.each do |exp_input, exp_output|
          it %Q{returns #{exp_output} for #{exp_input} as input} do
            RomanNumber.new(exp_input).convert_decimal_to_roman.should == exp_output
          end
        end
      end
      context 'For Invalid Input' do
        exp_output = InvalidInputError
        [
            4000, 0, -10, '10'
        ].each do |exp_input|
          it %Q{raises #{exp_output} for #{exp_input} as input} do
            expect {
              RomanNumber.new(exp_input).convert_decimal_to_roman
            }.to raise_error(exp_output)
          end
        end
      end
    end

    describe '#convert_roman_to_arabic' do
      context 'For Valid Input' do
        Helpers.valid_inputs.each do |exp_output, exp_input|
          it %Q{returns #{exp_output} for #{exp_input} as input} do
            RomanNumber.new(exp_input).convert_roman_to_decimal.should == exp_output
          end
        end
      end
      context 'For Invalid Input' do
        exp_output = InvalidInputError
        %w(ABCDE CCCCVII CCVVVVI XXM).each do |exp_input|
          it %Q{raises #{exp_output} for #{exp_input} as input} do
            expect {
              RomanNumber.new(exp_input).convert_roman_to_decimal
            }.to raise_error(exp_output)
          end
        end
      end
    end

    describe 'PRIVATE_INTERFACE' do 
      describe '#largest_repeatable_element' do
        # set 1
        [
            [3999, {:reduced_integer => 999, :largest_element => {:unit => :M, :value => 1000}, :times => 3}],
            [1066, {:reduced_integer => 66, :largest_element => {:unit => :M, :value => 1000}, :times => 1}],
            [207, {:reduced_integer => 7, :largest_element => {:unit => :C, :value => 100}, :times => 2}],
            [10, {:reduced_integer => 0, :largest_element => {:unit => :X, :value => 10}, :times => 1}],
        ].each do |exp_input, exp_output|
          it %Q{works for #{exp_input} as input} do
            output = @roman_number.send(:largest_repeatable_element, exp_input)
            output.should == exp_output
          end
        end
        # set 2
        [
            [999, StartsWithNonRepeatableRomanUnitError],
            [44, StartsWithNonRepeatableRomanUnitError],
        ].each do |exp_input, exp_output|
          it %Q{raises #{exp_output} for #{exp_input} as input} do
            expect {
              @roman_number.send(:largest_repeatable_element, exp_input)
            }.to raise_error(exp_output)
          end
        end
      end

      describe '#largest_non_repeatable_element' do
        before(:each) do
          @roman_number = RomanNumber.new(1)
        end
        [
            [999, {:reduced_integer => 99, :largest_element => {:unit => :CM, :value => 900}, :times => 1}],
            [900, {:reduced_integer => 0, :largest_element => {:unit => :CM, :value => 900}, :times => 1}],
            [44, {:reduced_integer => 4, :largest_element => {:unit => :XL, :value => 40}, :times => 1}],
            [49, {:reduced_integer => 9, :largest_element => {:unit => :XL, :value => 40}, :times => 1}],
        ].each do |exp_input, exp_output|
          it %Q{works for #{exp_input} as input} do
            output = @roman_number.send(:largest_non_repeatable_element, exp_input)
            output.should == exp_output
          end
        end
      end
    end

  end
end

