class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total_price
      t.date :completed_date, default: Time.zone.now
      t.string :aasm_state
      t.integer :user_id
      t.integer :delivery_id

      t.timestamps null: false
    end
    add_index :orders, :user_id
    add_index :orders, :delivery_id
  end
end
