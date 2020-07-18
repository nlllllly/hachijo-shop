class AddAdminidToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :admin_id, :integer
  end
end
