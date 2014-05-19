class SpotsController < ApplicationController

	# before_action :authenticate_with_basic_auth
	before_action :require_login

	def index

		@spots = Spot.all
		

		# @user = current_user
	
	end

end

