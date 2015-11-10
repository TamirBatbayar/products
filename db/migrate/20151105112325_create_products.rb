class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :supplier_id
      t.text :detail

      t.timestamps null: false
    end
  end
end
