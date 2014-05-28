class FlagsController < ApplicationController

	def new
    # do I need this when I don't have a NEW page for flags?
    # @spots = Spot.find(params[:spot_id])
    # @flags = Flag.new
    # session[:spot_id] = @spots.id

		render partial: "firstdate", locals: { first: @flags }
		render partial: "seconddate", locals: { second: @flags }
		render partial: "thirddate", locals: { third: @flags }
		render partial: "baddate", locals: { bad: @flags }
	end


	def create

		spot = Spot.find(flag_attributes[:spot_id])
		
  	if spot.flags.empty? == true
			Flag.create(flag_attributes)
	    flash[:notice] = "Liked!"
	  elsif spot.flags.empty? != true
			intersection = spot.flags.ids & current_user.flags.ids
			if intersection.empty? == false
					flash[:notice] = "Already Voted!"
			else
				Flag.create(flag_attributes)
		    flash[:notice] = "Liked!"
		  end
	  end
	  redirect_to spot_path(flag_attributes[:spot_id])
  end

  private

  def flag_attributes
  	params.require(:flag).permit(:spot_id, :user_id, :first_date, :second_date, :third_date, :bad_date)
  end

end

