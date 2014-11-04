require 'rails_helper'

	describe 'editing restaurants' do 

		context 'when a user is signed in' do 

			before do
				test_user = User.create(email: "sean@makers.com", password: "12345678", password_confirmation: "12345678")
		    	login_as test_user
		  	end

			it 'lets a user edit a restaurant ' do 
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

			it 'it does not let a user edit a restaurant they do not own' do 
				Restaurant.create(name: 'KFC')
				visit '/'
				expect(page).not_to have_content('Edit KFC')
			

			end

			it 'it does not let a user edit a restaurant they do not own via URI' do 
				Restaurant.create(name: 'KFC')
				visit '/restaurants/1/edit'
				expect(page).to have_content('You are not authorised to edit this restaurant')
			end

			it 'lets a user delete a restaurant ' do 
				visit '/'
				click_link 'Add a restaurant'
				fill_in 'Name', with: 'KFC'
				click_button 'Create Restaurant'
				visit '/'
				click_link 'Delete KFC'
				expect(page).not_to have_content 'KFC'
				expect(page).to have_content 'Restaurant deleted successfully'

			end

			it 'it does not a user delete a restaurant they do not own' do 
				Restaurant.create(name: 'KFC')
				visit '/'
				expect(page).not_to have_content('Delete KFC')
			

			end


		end

		# context 'when a user is NOT signed in' do 

		# 	before do
		# 		test_user = User.create(email: "sean@makers.com", password: "12345678", password_confirmation: "12345678")
		#     	login_as test_user
		# 	    visit '/'
		# 		click_link 'Add a restaurant'
		# 		fill_in 'Name', with: 'KFC'
		# 		click_button 'Create Restaurant'
		
		#   	end

		# 	it 'lets a user edit a restaurant ' do 
	
		# 		visit '/'
		# 		click_link 'Edit KFC'
		# 		fill_in 'Name', with: 'Kentucky Fried Chicken'
		# 		click_button 'Update Restaurant'
		# 		expect(page).to have_content 'Kentucky Fried Chicken'
		# 		expect(current_path).to eq "/restaurants"

		# 	end

		# end
	end