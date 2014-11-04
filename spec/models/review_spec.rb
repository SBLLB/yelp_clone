require 'spec_helper'

RSpec.describe Review, :type => :model do 
	it 'is invalid if the rating is more than 5' do
		review = Review.new(rating: 10)
		expect(review).to have(1).error_on(:rating)
	end 

	it 'has records the user ID of the user that authored it' do 
		review = Review.new(rating: 10, thoughts: "Blah Blah", user_id: 1)

	end 

end

# Do I have to test that a review has a 'author' here?