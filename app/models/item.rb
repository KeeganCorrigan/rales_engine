class Item < ApplicationRecord
  validates_presence_of :name, :description, :merchant_id, :unit_price, :created_at, :updated_at

  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def most_sold_by_day
    # TODO: adjust presentation of data at serializer level to match spec harness expectations
    invoices
    .select("sum(invoice_items.quantity) AS total_quantity, invoices.*")
    .joins(:invoice_items, :transactions)
    .merge(Transaction.success)
    .group("date_trunc('day', invoice_items.created_at), invoices.id")
    .order("total_quantity DESC")
    .limit(1)
    .first
    .created_at
  end
end

# item.invoices.select("sum(invoice_items.quantity) AS total_quantity, invoices.*").joins(:invoice_items, :transactions).merge(Transaction.success).group
# ("date_trunc('day', invoice_items.created_at), invoices.id").order("total_quantity DESC").limit(1).first.created_at
