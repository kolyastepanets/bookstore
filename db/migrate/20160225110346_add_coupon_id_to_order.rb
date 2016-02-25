class AddCouponIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :coupon_id, :integer
    add_index :orders, :coupon_id
  end
end
