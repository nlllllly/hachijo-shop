class CreateProducers < ActiveRecord::Migration[5.2]
  def change
    create_table :producers do |t|
      t.string :producer_name
      t.text :explanation
      t.string :url
      t.integer :producer_image_id

      t.timestamps
    end
  end
end
