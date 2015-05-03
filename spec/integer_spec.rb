require_relative './spec_helper'
include RomanNumbers

describe Integer do

  context "#to_roman" do

    it "is added and internally calls 'convert_decimal_to_roman'" do
      expect_any_instance_of(RomanNumbers::RomanNumber).to receive(:convert_decimal_to_roman)
      7999112.to_roman
    end
  end
end
