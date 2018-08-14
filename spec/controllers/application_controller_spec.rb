require 'rails_helper'

describe ApplicationController do
  describe '#format_unit_price' do
    it 'returns unit_price as string with decimal point two spaces from the right' do
      number = 300

      expect(number.format_unit_price).to eq("3.00")
    end
  end
end