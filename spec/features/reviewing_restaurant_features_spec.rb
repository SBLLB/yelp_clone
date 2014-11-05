require 'rails_helper'

describe 'When reviewing a restaurant' do

	before do
		db_user = User.create(email: "bob@makers.com", password: "12345678", password_confirmation: "12345678")
		login_as db_user
		Restaurant.create(name: 'Bills Cafe')
	end

	context 'and leaving a review' do

		it 'a user can leave a review' do
			visit '/restaurants'
			click_link 'Review Bills Cafe'
			fill_in "Thoughts", with: "So so"
			select '3', from: 'Rating'
			click_button 'Leave Review'
			expect(current_path).to eq '/restaurants'
			expect(page).to have_content('So so')
		end

		it 'a user can only leave one review per restaurant' do
			visit '/restaurants'
			click_link 'Review Bills Cafe'
			fill_in "Thoughts", with: "So so"
			select '3', from: 'Rating'
			click_button 'Leave Review'
			visit '/restaurants'
			expect(page).not_to have_content('Review Bills Cafe')
		end



	end

	

end
