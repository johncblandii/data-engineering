class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer
      t.references :merchant
      t.decimal :total, nil: false

      t.timestamps
    end
    add_index :orders, :customer_id
    add_index :orders, :merchant_id
  end
end
