require 'rails_helper'

	describe 'editing restaurants' do 

		context 'when a user is signed in' do 

			before do
				test_user = User.create(email: "sean@makers.com", password: "12345678", password_confirmation: "12345678")
		    	login_as test_user
			    visit '/'
				click_link 'Add a restaurant'
				fill_in 'Name', with: 'KFC'
				click_button 'Create Restaurant'
		
		  	end

			it 'lets a user edit a restaurant ' do 
	
				visit '/'
				click_link 'Edit KFC'
				fill_in 'Name', with: 'Kentucky Fried Chicken'
				click_button 'Update Restaurant'
				expect(page).to have_content 'Kentucky Fried Chicken'
				expect(current_path).to eq "/restaurants"

			end

		end
	end