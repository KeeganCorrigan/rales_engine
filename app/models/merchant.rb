class Merchant < ApplicationRecord
  validates_presence_of :name, :updated_at, :created_at

  has_many :invoices

  def revenue
    require 'pry'; binding.pry
    invoices
    .joins(:invoice_items, :transactions)
  end
end

# .where("transactions.status = 'success'")
#.select("SUM(invoice_items.quantity * invoice_items.unit_price")