class FlagsController < ApplicationController

	def create
  spot = Spot.find(flag_attributes[:spot_id])
		
  	if spot.flags.empty? == true
			Flag.create(flag_attributes)
	    flash[:notice] = "Liked!"
	  elsif spot.flags.empty? != true
			intersection = spot.flags.ids & current_user.flags.ids
			if intersection.empty? == false
					flash[:notice] = "Already Liked!"
			else
				Flag.create(flag_attributes)
		    flash[:notice] = "Liked!"
		  end
	  end
	  redirect_to "/spots/#{spot.id}"
  end

  private

  def flag_attributes
  	params.require(:flag).permit(:spot_id, :user_id, :first_date)
  end



end