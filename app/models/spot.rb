class Spot < ActiveRecord::Base
	has_many :users, through: :flags

	has_many :flags

	has_many :users, through: :comments

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

  def self.static_map(address)
    url = "http://maps.googleapis.com/maps/api/staticmap?size=350x350&scale=1&markers=color:red|#{address.gsub(' ', '+')},,New+York,NY|&key=#{GOOGLE_STATIC_KEY}"
  end

  def categorize

    vote_counter = {
      first_date: 0,
      second_date: 0,
      third_date: 0,
      bad_date: 0
    }

    vote_counter[:first_date] = self.flags.where(first_date:true).size
    vote_counter[:second_date] = self.flags.where(second_date:true).size
    vote_counter[:third_date] = self.flags.where(third_date:true).size
    vote_counter[:bad_date] = self.flags.where(bad_date:true).size

    hello = vote_counter.max_by{|date, votes| votes}
    if hello[1] == 0
      p "Give Feedback!"
    else
      p "Best for #{hello[0].to_s.gsub('_', ' ').upcase}" 
    end
  end 

end
    # if self.flags.where(first_date:true).size > self.flags.where(second_date:true).size && self.flags.where(third_date:true).size && self.flags.where(bad_date:true).size
    #   p "good for first date"
    # else
    #   p = "bad for dates"
    # end

    # vote_counter.each do |date,vote|
    #   self.flags.where(date = :true)
    #   vote_counter[date] = vote+1
    # end

    # if vote_counter.first_date.size > vote_counter.bad_date.size
    #     p "good for first date"
    # else
    #   p = "bad for dates"
    # end



#{@spot.address.gsub(' ', '+')}

# venues = jsonresponse["response"]["groups"][0]["items"][5]["tips"][0]["text"]

# || venue["tips"]["likes"]["count"] > 200


 # date_spots_array = []
 #    venues.each do |venue|
 #      if venue["venue"]["rating"] > 9.5
 #        date_spots_array << venue

 #      end

 #    end