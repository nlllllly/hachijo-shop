class AddProduceridToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :producer_id, :integer
  end
end
