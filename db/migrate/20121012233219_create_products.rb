class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, nil: false
      t.decimal :price, default:0, nil: false

      t.timestamps
    end
  end
end
