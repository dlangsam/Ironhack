class CreateSellerReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :seller_reviews do |t|
      t.integer :author_id
      t.integer :subject_id
      t.integer :product_id
      t.text :review_content
      t.integer :star_rating

      t.timestamps
    end
  end
end
