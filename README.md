# RomanNumbers

Conversion between Decimals and Roman Numbers

Roman numerals are based on seven symbols:

| Symbol      | Value     |
|:----------- |:--------- |
| I           | 1         |
| V           | 5         |
| X           | 10        |
| L           | 50        |
| C           | 100       |
| D           | 500       |
| M           | 1000      |


Numbers are formed by combining symbols together and adding the values. For example, MMVI is 1000 + 1000 + 5 + 1 = 2006.

Generally, symbols are placed in order of value, starting with the largest values. When smaller values precede larger values, the smaller values are subtracted from the larger values, and the result is added to the total. For example MCMXLIV = 1000 + (1000 − 100) + (50 − 10) + (5 − 1) = 1944.

* The symbols "I", "X", "C", and "M" can be repeated three times in succession, but no more. (They may appear four times if the third and fourth are separated by a smaller value, such as XXXIX.) "D", "L", and "V" can never be repeated.

* "I" can be subtracted from "V" and "X" only. "X" can be subtracted from "L" and "C" only. "C" can be subtracted from "D" and "M" only. "V", "L", and "D" can never be subtracted.

* Only one small-value symbol may be subtracted from any large-value symbol.

* A number written in Arabic numerals can be broken into digits. For example, 1903 is composed of 1, 9, 0, and 3. To write the Roman numeral, each of the non-zero digits should be treated separately. In the above example, 1,000 = M, 900 = CM, and 3 = III. Therefore, 1903 = MCMIII.

Refer: http://en.wikipedia.org/wiki/Roman_numerals

## Installation

Add this line to your application's Gemfile:

    gem 'roman_numbers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roman_numbers

## Usage

By explicitly using RomanNumber class:


    > require 'roman_numbers'


    > RomanNumbers::RomanNumber.new(3999).convert_decimal_to_roman

    "MMMCMXCIX"


    > RomanNumbers::RomanNumber.new('MMMCMXCIX').convert_roman_to_decimal

    3999


By directly on String and Integer objects:


    > 'MCMXLIV'.from_roman_to_decimal

    1944


    > 1944.to_roman

    "MCMXLIV"


    > 'MMMMMX'.from_roman_to_decimal

    RomanNumbers::InvalidInputError


    > 999383.to_roman

    RomanNumbers::InvalidInputError


## Contributing

1. Fork it

2. Create your feature branch (`git checkout -b my-new-feature`)

3. Commit your changes (`git commit -am 'Add some feature'`)

4. Push to the branch (`git push origin my-new-feature`)

5. Create new Pull Request
