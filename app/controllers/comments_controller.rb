class CommentsController < ApplicationController

	def new
		@spots = Spot.find(params[:spot_id])
		@comments = Comment.new
		session[:spot_id] = @spots.id
	end

	def create
		comment = Comment.new(comment_attributes)
		comment.spot_id = session[:spot_id]
		comment.user_id = current_user.id
		comment.save!
		
		session[:spot_id] = nil

		redirect_to spot_path(comment.spot_id)
	end


	def edit
		# spot id -> params[:id]
		@comment = Comment.find(params[:id])
	end

	def update
		comment = Comment.find(params[:id])
		comment.update_attributes(comment_attributes)
		redirect_to spot_path(params[:spot_id])
	end


	def destroy
		comment = Comment.find(params[:id])
		comment_origin = comment.spot.id
		comment.destroy

		redirect_to spot_path(comment_origin)
	end

	private

	def comment_attributes
 		params.require(:comment).permit(:opinion)
	end

end
