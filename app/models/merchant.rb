class Merchant < ApplicationRecord
  validates_presence_of :name, :updated_at, :created_at

  has_many :invoices
end
