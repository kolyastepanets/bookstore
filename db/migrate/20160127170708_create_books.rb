class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :books_in_stock
      t.integer :author_id
      t.integer :category_id

      t.timestamps null: false
    end
    add_index :books, :author_id
    add_index :books, :category_id
  end
end
