class AddReviewableToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :reviewable_type, :string
    add_column :reviews, :reviewable_id, :integer

    remove_column  :reviews, :blog_id 
  end
end
