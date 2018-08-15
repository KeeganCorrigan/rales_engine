class ChangeDateTimetoDate < ActiveRecord::Migration[5.1]
  def change
    change_column :merchants, :created_at, :date
    change_column :merchants, :updated_at, :date

    change_column :invoices, :created_at, :date
    change_column :invoices, :updated_at, :date

    change_column :customers, :created_at, :date
    change_column :customers, :updated_at, :date

    change_column :items, :created_at, :date
    change_column :items, :updated_at, :date

    change_column :transactions, :created_at, :date
    change_column :transactions, :updated_at, :date

    change_column :invoice_items, :created_at, :date
    change_column :invoice_items, :updated_at, :date
  end
end
