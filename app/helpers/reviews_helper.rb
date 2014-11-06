module ReviewsHelper
	def star_rating(rating)
    	if rating.is_a? Integer 
    		remainder = 5 - rating
    		return ('★' * rating)+('☆' * remainder)  
    	else return rating
    	end
  	end
end
