class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer :number, :integer, limit: 8
      t.integer :cvv
      t.integer :expiration_month
      t.integer :expiration_year
      t.integer :order_id

      t.timestamps null: false
    end
    add_index :credit_cards, :order_id
  end
end
