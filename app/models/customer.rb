class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name, :created_at,  :updated_at
end
