class Item < ApplicationRecord
  validates_presence_of :name, :description, :merchant_id, :unit_price, :created_at, :updated_at
  belongs_to :merchant
end
