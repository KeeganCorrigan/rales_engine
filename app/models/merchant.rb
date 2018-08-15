class Merchant < ApplicationRecord
  validates_presence_of :name, :updated_at, :created_at

  has_many :invoices

  def total_revenue
    invoices.joins(:invoice_items, :transactions)
            .where("transactions.result = 'success'")
            .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def total_by_date(date)
    invoices.joins(:invoice_items, :transactions)
            .where("transactions.result = 'success' AND invoices.created_at = '#{date}'")
            .sum("invoice_items.quantity * invoice_items.unit_price")
  end
end
