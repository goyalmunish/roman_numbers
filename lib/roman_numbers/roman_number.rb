require 'roman_numbers/version'

module RomanNumbers
  class RomanNumber

    ROMAN_REPEATABLE_UNITS = [
        {:unit => :M, :value => 1000}, # element first
        {:unit => :C, :value => 100},
        {:unit => :X, :value => 10},
        {:unit => :I, :value => 1} # element last
    ].sort { |x, y| y[:value] <=> x[:value] }

    ROMAN_NON_REPEATABLE_UNITS_1 = [
        {:unit => :D, :value => 500}, # element first
        {:unit => :L, :value => 50},
        {:unit => :V, :value => 5}, # element last
    ].sort { |x, y| y[:value] <=> x[:value] }

    ROMAN_NON_REPEATABLE_UNITS_2 = [
        {:unit => :CM, :value => 900}, # element first
        {:unit => :CD, :value => 400},
        {:unit => :XC, :value => 90},
        {:unit => :XL, :value => 40},
        {:unit => :IX, :value => 9},
        {:unit => :IV, :value => 4} # element last
    ].sort { |x, y| y[:value] <=> x[:value] }

    ROMAN_NON_REPEATABLE_UNITS = (ROMAN_NON_REPEATABLE_UNITS_1 + ROMAN_NON_REPEATABLE_UNITS_2).sort { |x, y| y[:value] <=> x[:value] }
    ROMAN_DOUBLE_UNITS = ROMAN_NON_REPEATABLE_UNITS_2.sort { |x, y| y[:value] <=> x[:value] }
    ROMAN_SINGLE_UNITS = (ROMAN_NON_REPEATABLE_UNITS_1 + ROMAN_REPEATABLE_UNITS).sort { |x, y| y[:value] <=> x[:value] }
    ROMAN_UNITS = (ROMAN_REPEATABLE_UNITS + ROMAN_NON_REPEATABLE_UNITS_1 + ROMAN_NON_REPEATABLE_UNITS_2).sort { |x, y| y[:value] <=> x[:value] }

    # based on above non_repeatable units, allowed repetition is 3
    MAX_ALLOWED_REPETITION = 3

    # initializing element
    def initialize(input)
      # checking input type and setting instance variables
      case input
        when Integer
          @input_integer = input
          @staged_roman_hash = Array.new
          @output_roman = String.new
        when String
          @input_string = input.upcase
          @output_arabic = 0
      end
    end

    # converts arabic to roman
    def convert_decimal_to_roman(input_integer=@input_integer)
      # validating input
      unless (1..3999).include? input_integer
        raise InvalidInputError, "Invalid Input: #{input_integer}"
      end
      # getting staged roman hash
      calculate_staged_roman_hash(input_integer)
      # extracting hash from staged roman hash
      @staged_roman_hash.each do |element|
        @output_roman << (element[:largest_element][:unit].to_s)*(element[:times])
      end
      return @output_roman
    end

    # converts given arabic number (in string form) to corresponding integer
    def convert_roman_to_decimal(input_roman=@input_string.clone)
      input_roman
      # generating regex expressions
      double_units_array = ROMAN_NON_REPEATABLE_UNITS_2.map { |element| ('^' + element[:unit].to_s) }
      single_units_array = (ROMAN_REPEATABLE_UNITS + ROMAN_NON_REPEATABLE_UNITS_1).map { |element| ('^' + element[:unit].to_s) }
      double_units_regex = Regexp.new(double_units_array.join('|'))
      single_units_regex = Regexp.new(single_units_array.join('|'))
      # validation
      # TODO: to add more validations
      if input_roman =~ /(.)\1{#{MAX_ALLOWED_REPETITION},}/
        raise InvalidInputError, "Invalid Input: #{input_roman}"
      end
      # processing
      if input_roman.length > 0
        if unit = input_roman.slice!(double_units_regex)
          @output_arabic += ROMAN_DOUBLE_UNITS.find { |element| element[:unit] == unit.to_sym }[:value]
          convert_roman_to_decimal(input_roman)
        elsif unit = input_roman.slice!(single_units_regex)
          @output_arabic += ROMAN_SINGLE_UNITS.find { |element| element[:unit] == unit.to_sym }[:value]
          convert_roman_to_decimal(input_roman)
        else
          # invalud input
          raise InvalidInputError, "Invalid Input: #{input_roman}"
        end
      else
        # process is complete
        return @output_arabic
      end

    end

    private

    # returns an array of hashed containing info on desired output roman
    def calculate_staged_roman_hash(input_integer)
      begin
        temp_hash = largest_repeatable_element(input_integer)
      rescue StartsWithNonRepeatableRomanUnitError => ex
        temp_hash = largest_non_repeatable_element(input_integer)
      end
      if temp_hash
        @staged_roman_hash << temp_hash
        input_integer = temp_hash[:reduced_integer]
        calculate_staged_roman_hash(input_integer)
      else
        # processing done
        return @staged_roman_hash
      end
    end

    # returns reduced_integer, largest repeatable element, and number of times it can be repeated
    def largest_repeatable_element(input_integer)
      if input_integer > 0
        largest_element = ROMAN_REPEATABLE_UNITS.find { |element| input_integer >= element[:value] }
        # TODO: make it efficient by removing elements before largest_element
        # TODO: to use binary search instead
        if largest_element
          times = input_integer/largest_element[:value]
          reduced_integer = input_integer%largest_element[:value]
          if times > MAX_ALLOWED_REPETITION
            # given integer starts with non_repeatable roman unit
            raise StartsWithNonRepeatableRomanUnitError
          end
          return {:reduced_integer => reduced_integer, :largest_element => largest_element, :times => times}
        else
          # non-reachable code
          raise NonReachableCodeError, 'LargestElementIsNil'
        end
      elsif input_integer == 0
        # process completed
        return nil
      else
        # non-reachable code
        # input_integer has to be >=0
        raise NonReachableCodeError, 'ReceivedNegativeInteger'
      end
    end

    # returns largest non-repeatable element
    def largest_non_repeatable_element(input_integer)
      if input_integer > 0
        largest_element = ROMAN_NON_REPEATABLE_UNITS.find { |element| input_integer >= element[:value] }
        # TODO: make it efficient by removing elements before largest_element
        # TODO: to use binary search instead
        if largest_element
          reduced_integer = input_integer%largest_element[:value]
          return {:reduced_integer => reduced_integer, :largest_element => largest_element, :times => 1}
        else
          # no non_repeatable element preset, but process is not complete yet
          return {:reduced_integer => input_integer, :largest_element => nil, :times => 0}
        end
      elsif input_integer == 0
        # process completed
        return nil
      else
        # non-reachable code
        # input_integer has to be >=0
        raise NonReachableCodeError, 'ReceivedNegativeInteger'
      end
    end

  end
end
