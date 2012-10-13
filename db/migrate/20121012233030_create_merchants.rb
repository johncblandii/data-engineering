class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name, nil: false
      t.text :address

      t.timestamps
    end
  end
end
