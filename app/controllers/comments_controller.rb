class CommentsController < ApplicationController

	def create
		Comment.create(comment_attributes)

		redirect_to "/spots/#{comment_attributes[:spot_id]}"
	end


	private

	def comment_attributes

 		params.require(:comment).permit(:spot_id, :user_id, :opinion)
	end



end
