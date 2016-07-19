class Sandwich < ApplicationRecord
	has_many :sandwich_ingredient
	has_many :ingredients, through: "sandwich_ingredient"
end
