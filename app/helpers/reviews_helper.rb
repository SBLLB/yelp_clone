module ReviewsHelper
	def star_rating(rating)
		
    	if rating.is_a? Integer 
    		return ('★' * rating)
    	else return rating
    	end
  	end
end
