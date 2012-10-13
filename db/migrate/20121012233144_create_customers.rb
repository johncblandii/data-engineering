class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, nil: false

      t.timestamps
    end
  end
end
