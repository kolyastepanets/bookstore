class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :type
      t.integer :country_id
      t.integer :zip
      t.integer :phone, :integer, limit: 8
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps null: false
    end
    add_index :addresses, [:addressable_type, :addressable_id]
  end
end
