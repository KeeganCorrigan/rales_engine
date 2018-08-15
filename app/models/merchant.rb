class Merchant < ApplicationRecord
  validates_presence_of :name, :updated_at, :created_at

  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def total_revenue
    invoices.joins(:invoice_items, :transactions)
            .merge(Transaction.success)
            .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def total_by_date(date)
    invoices.joins(:invoice_items, :transactions)
            .merge(Transaction.success)
            .where(created_at: date.to_datetime.beginning_of_day..date.to_datetime.end_of_day)
            .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.most_items(merchants_count)
    select("merchants.*, sum(invoice_items.quantity) AS total_items_sold")
    .joins(:invoice_items, :transactions, :invoices)
    .merge(Transaction.success)
    .group(:id)
    .order("total_items_sold DESC")
    .limit(merchants_count)
  end
end
