class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :book_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :reviews, :book_id
    add_index :reviews, :user_id
  end
end
