require 'roman_numbers/version'

module RomanNumbers
  class RomanNumber

    ROMAN_REPEATABLE_UNITS = [
        {:unit => :M, :value => 1000},
        {:unit => :C, :value => 100},
        {:unit => :X, :value => 10},
        {:unit => :I, :value => 1},
    ]

    ROMAN_NON_REPEATABLE_UNITS = [
        {:unit => :D, :value => 500},
        {:unit => :L, :value => 50},
        {:unit => :V, :value => 5},
        {:unit => :CM, :value => 900},
        {:unit => :CD, :value => 400},
        {:unit => :XC, :value => 90},
        {:unit => :XL, :value => 40},
        {:unit => :IX, :value => 9},
        {:unit => :IV, :value => 4},
    ]

    ACCEPTABLE_REPEATABILITY = 3

    # initializing element
    def initialize(given_integer)
      @given_integer = given_integer
      # making sure arrays are sorted
      ROMAN_REPEATABLE_UNITS.sort!{|x, y| y[:value] <=> x[:value]}
    end

    # returns largest repeatable unit, and number of times it can be repeated
    def largest_repeatable_unit(given_integer)

    end

    # returns largest non-repeatable unit
    def largest_non_repeatable_unit(given_integer)

    end

    # convert integer to roman
    def convert_integer_to_roman

    end

  end
end
