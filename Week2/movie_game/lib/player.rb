#player.rb

class Player
	attr_reader :score, :questions_answered
	def initialize
		@score = 0
		@questions_answered = 0
	end

	def answered_right
		@score +=1
		@questions_answered +=1
	end
	def answered_wrong
		@questions_answered += 1
	end
	def clear_score
		@score = 0
		@questions_answered = 0
	end
end