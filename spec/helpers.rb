module Helpers
  def input_set_1
    [
        {integer: 39, roman: 'XXXIX'}, 
        {integer: 390, roman: 'CCCXC'}, 
    ]
  end
  module_function :input_set_1
  def input_set_2
    [
        {integer: 4, roman: 'IV'}, 
        {integer: 9, roman: 'IX'},
        {integer: 40, roman: 'XL'},
        {integer: 90, roman: 'XC'},
        {integer: 400, roman: 'CD'},
        {integer: 900, roman: 'CM'},
    ]
  end
  module_function :input_set_2
  def valid_inputs
    [
       {integer: 1, roman: 'I'},
       {integer: 5, roman: 'V'},
       {integer: 10, roman: 'X'},
       {integer: 50, roman: 'L'},
       {integer: 100, roman: 'C'},
       {integer: 500, roman: 'D'},
       {integer: 1000, roman: 'M'},
       {integer: 4, roman: 'IV'},
       {integer: 9, roman: 'IX'},
       {integer: 40, roman: 'XL'},
       {integer: 90, roman: 'XC'},
       {integer: 400, roman: 'CD'},
       {integer: 900, roman: 'CM'},
       {integer: 207, roman: 'CCVII'},
       {integer: 1066, roman: 'MLXVI'},
       {integer: 44, roman: 'XLIV'},
       {integer: 49, roman: 'XLIX'},
       {integer: 904, roman: 'CMIV'},
       {integer: 944, roman: 'CMXLIV'},
       {integer: 1904, roman: 'MCMIV'},
       {integer: 1944, roman: 'MCMXLIV'},
       {integer: 3999, roman: 'MMMCMXCIX'},
    ]
  end
  module_function :valid_inputs
end
