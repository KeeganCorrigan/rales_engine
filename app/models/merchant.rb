class Merchant < ApplicationRecord
  validates_presence_of :name, :updated_at, :created_at

  has_many :invoices

  def total_revenue
    invoices.joins(:invoice_items, :transactions)
            .where("transactions.result = 'success'")
            .sum("invoice_items.quantity * invoice_items.unit_price")
  end
end

# SELECT SUM(i_i.quantity * i_i.unit_price) FROM merchants m
# INNER JOIN invoices i ON m.id = i.merchant_id
# INNER JOIN invoice_items i_i ON i.id = i_i.invoice_id
# INNER JOIN transactions t ON i.id = t.invoice_id
# WHERE m.id = 54 AND t.result = 'success';