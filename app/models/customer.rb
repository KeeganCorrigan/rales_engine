class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name, :created_at,  :updated_at

  has_many :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants.order("count(merchants.id)")
             .group(:id)
            .last
  end
end
