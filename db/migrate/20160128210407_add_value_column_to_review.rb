class AddValueColumnToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :value, :integer
  end
end
