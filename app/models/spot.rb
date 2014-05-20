class Spot < ActiveRecord::Base
	has_many :users, through: :flags

	has_many :flags

	# has_many :users, through: :comments

	has_many :comments




  # test to print out all the names 
	def self.explore
    url =  "https://api.foursquare.com/v2/venues/explore?ll=40.732253,-73.987411&client_id=#{ENV["FOURSQUARE_CLIENT_ID"]}&client_secret=#{ENV["FOURSQUARE_CLIENT_SECRET"]}&v=20140518&query=date"
    
    jsonresponse = JSON.parse(HTTParty.get(url).body)

    venues = jsonresponse["response"]["groups"][0]["items"]

    date_spots_array = []
    venues.each do |venue|
      if venue["venue"]["likes"]["count"] > 100
        date_spots_array << venue
      end

    end

    return date_spots_array
  end

end




# def add_portion(quantity, unit_name, ingredient_name)
#     #
#     ingredient = Ingredient.find_by_name(ingredient_name)

#     # if ingredient is found...
#     if ingredient
#       # get this instance of recipe's own portions
#       self.portions << Portion.create({






# venues = jsonresponse["response"]["groups"][0]["items"][5]["tips"][0]["text"]

# || venue["tips"]["likes"]["count"] > 200


 # date_spots_array = []
 #    venues.each do |venue|
 #      if venue["venue"]["rating"] > 9.5
 #        date_spots_array << venue

 #      end

 #    end