class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.decimal :price
      t.integer :quantity
      t.integer :book_id
      t.integer :order_id

      t.timestamps null: false
    end
    add_index :order_items, :book_id
    add_index :order_items, :order_id
  end
end
