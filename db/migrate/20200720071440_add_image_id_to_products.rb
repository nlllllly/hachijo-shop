class AddImageIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_image_id, :string
  end
end
