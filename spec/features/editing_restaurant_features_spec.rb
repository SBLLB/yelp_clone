require 'rails_helper'

	describe 'When editing a restaurant' do 

		before do
				test_user = User.create(email: "sean@makers.com", password: "12345678", password_confirmation: "12345678")
		    	login_as test_user
		end


		context 'that the user owns' do 

			it 'it lets the user edit the restaurant ' do 
				visit '/'
				click_link 'Add a restaurant'
				fill_in 'Name', with: 'KFC'
				click_button 'Create Restaurant'
				visit '/'
				click_link 'Edit KFC'
				fill_in 'Name', with: 'Kentucky Fried Chicken'
				click_button 'Update Restaurant'
				expect(page).to have_content 'Kentucky Fried Chicken'
				expect(current_path).to eq "/restaurants"
			end

		end

		context 'that the user DOES NOT own' do 

			it 'it does not let the user edit the restaurant' do 
				Restaurant.create(name: 'KFC')
				visit '/'
				expect(page).not_to have_content('Edit KFC')
			end

			it 'it does not let the user edit the restaurant via the URI' do 
				Restaurant.create(name: 'KFC')
				visit '/restaurants/1/edit'
				expect(page).to have_content('You are not authorised to edit this restaurant')
			end
		end
	end