require 'roman_numbers/version'
require 'roman_numbers/roman_number'

module RomanNumbers
  # custom Exceptions
  class Error < StandardError;
  end
  class StartsWithNonRepeatableRomanUnitError < Error;
  end
  class NonReachableCodeError < Error;
  end
  class InvalidInputError < Error;
  end
end

# opening String class to add from_roman_to_integer method
class String
  def from_roman_to_integer
    RomanNumbers::RomanNumber.new(self).convert_roman_to_decimal
  end
end

# opening Integer class to add from_integer_to_roman method
class Integer
  def to_roman
    RomanNumbers::RomanNumber.new(self).convert_decimal_to_roman
  end
end

