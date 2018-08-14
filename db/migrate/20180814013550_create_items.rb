class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.references :merchant, foreign_key: true
      t.integer :unit_price
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
