class SpotsController < ApplicationController

	# before_action :authenticate_with_basic_auth
	before_action :require_login

	def index

		@array = Spot.explore
		

		# @user = current_user
	
	end

end

