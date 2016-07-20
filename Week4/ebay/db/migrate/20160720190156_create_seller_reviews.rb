class CreateSellerReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :seller_reviews do |t|
      t.integer, :user_id
      t.integer, :seller_id
      t.integer, :produce_id
      t.text, :review_content
      t.integer :star_rating

      t.timestamps
    end
  end
end
