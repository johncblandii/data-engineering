class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name, nil: false
      t.string :address

      t.timestamps
    end
  end
end
