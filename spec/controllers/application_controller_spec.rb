require "rails_helper"

describe ApplicationController do
  describe "#string_to_number" do
    it "converts a unit_price string to a number" do
      expect(subject.string_to_number("123.45")).to eq(12345)
    end
  end
end
