class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name, :created_at,  :updated_at

  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    merchants.joins(:transactions)
    .merge(Transaction.success)
    .order("count(merchants.id)")
    .group(:id)
    .last
  end

  def self.customers_with_pending_invoices(merchant_id)
    find_by_sql(
                  "SELECT c.* FROM customers c
                  INNER JOIN invoices i ON i.customer_id = c.id
                  WHERE i.merchant_id = #{merchant_id}
                    EXCEPT
                    SELECT c.* FROM customers c
                    INNER JOIN invoices i ON i.customer_id = c.id
                    INNER JOIN transactions t ON t.invoice_id = i.id
                    WHERE i.merchant_id = #{merchant_id} AND t.result = 'success'
                  ;"
                )
  end
end
