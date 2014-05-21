class CommentsController < ApplicationController

	def new
		@spots = Spot.find(params[:spot_id])
		@comments = Comment.new

	end

	def create
		Comment.create(comment_attributes)

		redirect_to "/spots/#{comment_attributes[:spot_id]}"
	end


	def edit
		# spot id -> params[:id]

		@comment = Comment.find(params[:comment_id])

	end

	def update

		comment = Comment.find(params[:id])

		comment.update_attributes(comment_attributes)

		redirect_to "/spots/#{comment_attributes[:spot_id]}"

	end


	def destroy
		comment = Comment.find(params[:id])
		comment_origin = comment.spot.id
		comment.destroy

		redirect_to "/spots/#{comment_origin}"
	end

	private

	def comment_attributes

 		params.require(:comment).permit(:spot_id, :user_id, :opinion)
	end



end
