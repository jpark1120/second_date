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
  	@id_spot = params[:spot_id]
  	@id_user = params[:user_id]

  	spot = Spot.find(@id_spot)
		
  	if spot.flags[0] != nil
			spot.flags.each do |flag| 
				if current_user == flag.user
					puts "Already Liked!"
					flash[:notice] = "Already Liked!"
				else
					Flag.create({
			      spot_id: "#{@id_spot}",
			      user_id: "#{@id_user}",
			      first_date: "true"
			    })
			    flash[:notice] = "Liked!"
			  end
	  	end
  	else
			Flag.create({
	      spot_id: "#{@id_spot}",
	      user_id: "#{@id_user}",
	      first_date: "true"
	    })
	    flash[:notice] = "Liked!"
	  end
  	redirect_to "/spots/#{@id_spot}"
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




