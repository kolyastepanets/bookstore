class AddToOrderCheckoutId < ActiveRecord::Migration
  def change
    add_column :orders, :checkout_id, :integer
  end
end
