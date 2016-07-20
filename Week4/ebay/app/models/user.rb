class User < ApplicationRecord
	has_many :products
	has_many :seller_reviews, class_name: :SellerReview, foreign_key: :subject_id
	validates :email, presence: true,  uniqueness: true
end
