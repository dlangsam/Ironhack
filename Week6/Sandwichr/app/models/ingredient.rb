class Ingredient < ApplicationRecord
	has_many :sandwich_ingredient
	has_many :sandwiches, through: "sandwich_ingredient"
end
