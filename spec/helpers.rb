module Helpers
  def input_set_1
    [
        {decimal: 39, roman: 'XXXIX'}, 
        {decimal: 390, roman: 'CCCXC'}, 
    ]
  end
  module_function :input_set_1
  def input_set_2
    [
        {decimal: 4, roman: 'IV'}, 
        {decimal: 9, roman: 'IX'},
        {decimal: 40, roman: 'XL'},
        {decimal: 90, roman: 'XC'},
        {decimal: 400, roman: 'CD'},
        {decimal: 900, roman: 'CM'},
    ]
  end
  module_function :input_set_2
  def valid_inputs
    [
       {decimal: 1, roman: 'I'},
       {decimal: 5, roman: 'V'},
       {decimal: 10, roman: 'X'},
       {decimal: 50, roman: 'L'},
       {decimal: 100, roman: 'C'},
       {decimal: 500, roman: 'D'},
       {decimal: 1000, roman: 'M'},
       {decimal: 4, roman: 'IV'},
       {decimal: 9, roman: 'IX'},
       {decimal: 40, roman: 'XL'},
       {decimal: 90, roman: 'XC'},
       {decimal: 400, roman: 'CD'},
       {decimal: 900, roman: 'CM'},
       {decimal: 207, roman: 'CCVII'},
       {decimal: 1066, roman: 'MLXVI'},
       {decimal: 44, roman: 'XLIV'},
       {decimal: 49, roman: 'XLIX'},
       {decimal: 904, roman: 'CMIV'},
       {decimal: 944, roman: 'CMXLIV'},
       {decimal: 1904, roman: 'MCMIV'},
       {decimal: 1944, roman: 'MCMXLIV'},
       {decimal: 3999, roman: 'MMMCMXCIX'},
    ]
  end
  module_function :valid_inputs
end
