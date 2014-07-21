class SpotsController < ApplicationController

	# before_action :authenticate_with_basic_auth
	before_action :require_login

	def index
		@spots = Spot.all
	end


	def show
		@spot = Spot.find(params[:id])
		@address = Spot.static_map(@spot.address)
		@flags = Flag.new
	end

end



	# current_flag = flag.new()
	# current_flag.spot_id = @spot.id
	# current_flag.user_id = @user.id
	# current_flag.save



			# case flag
			# 	when current_user.id != flag.user.id
			# 		Flag.create({
			#       spot_id: "#{@id_spot}",
			#       user_id: "#{@id_user}",
			#       first_date: "true"
			#     })
			#     flash[:notice] = "Liked!"
			#   when current_user.id == flag.user.id
			#   	puts "Already Liked!"
			# 		flash[:notice] = "Already Liked!"
			# 	else 
			# 		puts "Whatever"
			# end