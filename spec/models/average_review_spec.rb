require 'rails_helper'

describe '#average_rating' do
  context 'no reviews' do
    it 'returns "N/A" when there are no reviews' do
      restaurant = Restaurant.create(name: "The Ivy")
      expect(restaurant.average_rating).to eq 'N/A'
    end
  end

  	context '1 review' do
  		it 'returns that rating' do
   	 		restaurant = Restaurant.create(name: "The Ivy")
    		restaurant.reviews.create(rating: 4)
   			expect(restaurant.average_rating).to eq 4
  		end
	end
end