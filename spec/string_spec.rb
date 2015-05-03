require_relative './spec_helper'
include RomanNumbers

describe String do

  context "#from_roman_to_integer" do

    it "is added and internally calls 'convert_roman_to_decimal'" do
      expect_any_instance_of(RomanNumbers::RomanNumber).to receive(:convert_roman_to_decimal)
      "some_string".from_roman_to_integer
    end
  end
end
