module Helpers
  def self.valid_inputs
    [
        [1, 'I'],
        [5, 'V'],
        [10, 'X'],
        [50, 'L'],
        [100, 'C'],
        [500, 'D'],
        [1000, 'M'],
        [4, 'IV'],
        [9, 'IX'],
        [40, 'XL'],
        [90, 'XC'],
        [400, 'CD'],
        [900, 'CM'],
        [207, 'CCVII'],
        [1066, 'MLXVI'],
        [44, 'XLIV'],
        [49, 'XLIX'],
        [904, 'CMIV'],
        [944, 'CMXLIV'],
        [1904, 'MCMIV'],
        [1944, 'MCMXLIV'],
        [3999, 'MMMCMXCIX'],
    ]
  end
end
