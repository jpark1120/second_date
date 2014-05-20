class SpotsController < ApplicationController

	# before_action :authenticate_with_basic_auth
	before_action :require_login

	def index

		@spots = Spot.all
		

		# @user = current_user
	
	end

	def show

		@spot = Spot.find(params[:id])

	end


  def mod_flag
    # if first_date: params[:first_date] == true

      Flag.create({
        spot_id: params[:spot_id],
        user_id: params[:user_id],
        first_date: "true"
      })
    # else
    # end
    redirect_to "/spots/#{params[:spot_id]}"
  end

	# def update

	# 	@spot = Spot.find(params[:id])

	# 	@spot.vote

	# 	redirect_to spots_path

	# end

end




