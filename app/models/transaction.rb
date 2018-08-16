class Transaction < ApplicationRecord
  validates_presence_of :credit_card_number, :result, :created_at, :updated_at

  belongs_to :invoice
  scope :success, -> { where(result: 'success') }
  default_scope -> {order(id: :asc)}
end
