require 'rails_helper'

describe '#average_rating' do
  context 'no reviews' do
    it 'returns "N/A" when there are no reviews' do
      restaurant = Restaurant.create(name: "The Ivy")
      expect(restaurant.average_rating).to eq 'N/A'
    end
  end
end