class Merchant < ApplicationRecord
  validates_presence_of :name, :updated_at, :created_at

  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.revenue_by_date(date)
    joins(:invoices => [:transactions, :invoice_items])
      .merge(Transaction.success)
      .where(invoices: { created_at: date.to_datetime.beginning_of_day..date.to_datetime.end_of_day })
      .sum("invoice_items.quantity * invoice_items.unit_price")
  end

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
      .joins(:invoices => [:invoice_items, :transactions])
      .merge(Transaction.success)
      .group(:id)
      .order("total_items_sold DESC")
      .limit(merchants_count)
  end

  def favorite_customer
    customers.joins(:transactions)
    .merge(Transaction.success)
    .order("count(customers.id)")
    .group(:id)
    .last
  end
end
