class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.decimal :price
      t.string :name

      t.timestamps null: false
    end
  end
end
