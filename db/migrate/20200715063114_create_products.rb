class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :explanation
      t.integer :stock

      t.timestamps
    end
  end
end
