require_relative '../spec_helper'

module RomanNumbers
  describe RomanNumber do

    $invalid_input_error = InvalidInputError

    before(:each) do
      @roman_number = RomanNumber.new(1)
    end
    
    describe '#convert_decimal_to_roman' do
      shared_examples_for "works_with_valid_integral_input_and_roman_output_collection" do |array|
        # Note: here array is array of hashes
        array.each do |hsh|
          it %Q{returns #{hsh[:roman]} for #{hsh[:decimal]} as input} do
            RomanNumber.new(hsh[:decimal]).convert_decimal_to_roman.should == hsh[:roman]
          end
        end
      end
    
      context 'For Following Valid Inputs' do
        it_behaves_like "works_with_valid_integral_input_and_roman_output_collection", Helpers.valid_inputs
      end
    
      context 'For Following Invalid Input' do
        [4000, 0, -10, '10'].each do |exp_input|
          it %Q{raises #{$invalid_input_error} for #{exp_input} as input} do
            expect {
              RomanNumber.new(exp_input).convert_decimal_to_roman
            }.to raise_error($invalid_input_error)
          end
        end
      end
    end

    describe '#convert_roman_to_decimal' do
      shared_examples_for "works_with_valid_roman_input_and_integral_output_collection" do |array|
        # Note: here array is array of hashes
        array.each do |hsh|
          it %Q{returns #{hsh[:decimal]} for #{hsh[:roman]} as input} do
            RomanNumber.new(hsh[:roman]).convert_roman_to_decimal.should == hsh[:decimal]
          end
        end
      end

      shared_examples_for "raises_error_on_invalid_roman_input_collection" do |array|
        # Note: here array is array of integers
        array.each do |integral_elem|
          it %Q{raises #{$invalid_input_error} for #{integral_elem} as input} do
            expect {
              RomanNumber.new(integral_elem).convert_decimal_to_roman
            }.to raise_error($invalid_input_error)
          end
        end
      end

      context %q(Symbols 'I', 'X', 'C', and 'M' cannot be repeated more than three times in succession) do 
        it_behaves_like "raises_error_on_invalid_roman_input_collection", %w(VIIII IIIIV XXXXI XXXXC CCCCX XCCCC MMMMC)
      end
    
      context %q(Symbols 'I', 'X', 'C', and 'M' can be repeated 4 times if 3rd and 4th are separated by smaller value) do 
        it_behaves_like "works_with_valid_roman_input_and_integral_output_collection", Helpers.input_set_1
      end

      context %q(Symbols 'D', 'L', 'V' can never be repeated in succession) do 
        it_behaves_like "raises_error_on_invalid_roman_input_collection", %w(DD DDC LL LLX VV VVI)
      end

      context %Q(Symbol 'I' can be subtracted from 'V' and 'X', and
        Symbol 'L' can be subtracted from 'L' and 'C', and
        Symbol 'C' can be subtracted from 'D' and 'M') do 
        it_behaves_like "works_with_valid_roman_input_and_integral_output_collection", Helpers.input_set_2
      end

      context %Q(Symbol 'I' can be subtrated from 'V' and 'X' only, and
        Symbol 'X' can be subtracted from 'L' and 'C' only, and
        Symbol 'C' can be subtracted from 'D' and 'M' only) do
        it_behaves_like "raises_error_on_invalid_roman_input_collection", %w(IL IC ID IM XD XM)
      end

      context 'For Valid Input' do
        Helpers.valid_inputs.each do |hsh|
          it %Q{returns #{hsh[:roman]} for #{hsh[:decimal]} as input} do
            RomanNumber.new(hsh[:roman]).convert_roman_to_decimal.should == hsh[:decimal]
          end
        end
      end

      context 'For Invalid Input' do
        %w(ABCDE CCCCVII CCVVVVI).each do |exp_input|
          it %Q{raises #{$invalid_input_error} for #{exp_input} as input} do
            expect {
              RomanNumber.new(exp_input).convert_roman_to_decimal
            }.to raise_error($invalid_input_error)
          end
        end
      end
    end

    describe 'PRIVATE_INTERFACE (for developer)' do 
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

