# RomanNumbers

Conversion between Integers and Roman Numbers

## Installation

Add this line to your application's Gemfile:

    gem 'roman_numbers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roman_numbers

## Usage

Some Examples:

    > RomanNumbers::RomanNumber.new(3999).convert_decimal_to_roman
    "MMMCMXCIX"

    > RomanNumbers::RomanNumber.new('MMMCMXCIX').convert_roman_to_decimal
    3999

    > 'MCMXLIV'.from_roman_to_integer
    1944

    > 1944.to_roman
    "MCMXLIV"

    > 'MMMMMX'.from_roman_to_integer
    RomanNumbers::InvalidInputError

    > 999383.to_roman
    RomanNumbers::InvalidInputError

## Contributing

1. Fork it

2. Create your feature branch (`git checkout -b my-new-feature`)

3. Commit your changes (`git commit -am 'Add some feature'`)

4. Push to the branch (`git push origin my-new-feature`)

5. Create new Pull Request
