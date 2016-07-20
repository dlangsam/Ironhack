class SellerReview < ApplicationRecord
	belongs_to :subject,  class_name: :User, foreign_key: :subject_id  # Looks for a model called Subject
  	belongs_to :author, class_name: :User, foreign_key: :author_id
  	belongs_to :product
end
