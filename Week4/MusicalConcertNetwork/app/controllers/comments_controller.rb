class CommentsController < ApplicationController
	def create
		@concert = Concert.find(params[:concert_id])
		@comment = @concert.comments.new(comment_params)
		@comment.concert_id = @concert.id

		@comment.save
		redirect_to "/concerts/#{@concert.id}"
		
	end
	private
	def comment_params
		params.require(:comment).permit(:name, :comment)
	end
end
