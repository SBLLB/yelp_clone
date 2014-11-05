require 'rails_helper'

describe 'When deleting a review of a restaurant' do

	before do
		db_user = User.create(email: "bob@makers.com", password: "12345678", password_confirmation: "12345678")
		login_as db_user
		Restaurant.create(name: 'Bills Cafe', id: 1)
	end

	context 'a user who has authored the review' do

		it 'can see a link to delete it' do
			visit '/restaurants'
			click_link 'Review Bills Cafe'
			fill_in "Thoughts", with: "New review"
			select '3', from: 'Rating'
			click_button 'Leave Review'
			visit '/restaurants'
			expect(page).to have_content('Delete Review')
			click_link 'Delete Review'
		end

		it 'can delete it' do
			visit '/restaurants'
			click_link 'Review Bills Cafe'
			fill_in "Thoughts", with: "New review"
			select '3', from: 'Rating'
			click_button 'Leave Review'
			visit '/restaurants'
			click_link 'Delete Review'
			expect(page).to have_content('Review deleted successfully')
			expect(current_path).to eq '/restaurants'
 
		end

	end

	context ' a user who has NOT authored the review' do 
		
		it 'cannot see a link to delete the review ' do
			Review.create(thoughts: 'test review thought', rating: 3, restaurant_id: 1)
			visit '/restaurants'
			expect(page).to have_content('test review thought')
			expect(page).not_to have_content('Delete Review')
		end

	end


end