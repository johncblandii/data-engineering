class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :product, nil: false
      t.references :order, nil: false
      t.decimal :price, nil: false
      t.integer :quantity, default:1, nil: false

      t.timestamps
    end
    add_index :order_items, :product_id
    add_index :order_items, :order_id
  end
end
