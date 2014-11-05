require 'rails_helper'

describe 'When deleting a restaurant' do 

	before do
		test_user = User.create(email: "sean@makers.com", password: "12345678", password_confirmation: "12345678")
		login_as test_user
	end
			
	context 'that the user owns' do 

		before do 
			visit '/'
			click_link 'Add a restaurant'
			fill_in 'Name', with: 'KFC'
			click_button 'Create Restaurant'
		end 

		it 'it lets the user delete the restaurant ' do 
			visit '/'
			click_link 'Delete KFC'
			expect(page).not_to have_content 'KFC'
			expect(page).to have_content 'Restaurant deleted successfully'
		end

		it 'removes a restaurant when a user clicks delete link' do 
			visit '/restaurants'
			click_link 'Delete KFC' 
			expect(page).not_to have_content 'KFC'
			expect(page).to have_content 'Restaurant deleted successfully'
		end 
	end

	context 'that the user DOES NOT own' do 

		it 'it does not let the user delete the restaurant' do 
			Restaurant.create(name: 'KFC')
			visit '/'
			expect(page).not_to have_content('Delete KFC')
		end
	end
end

