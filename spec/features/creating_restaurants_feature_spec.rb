require 'rails_helper'

describe 'When creating a restaurant' do 

	include Rack::Test::Methods

	before do
	 	test_user = User.create(email: "sean@makers.com", password: "12345678", password_confirmation: "12345678")
		login_as test_user
 	 end
		
		context 'with valid length restaurant name' do

			it 'it allows the user to fill out a form, then displays the new restaurant' do 
				visit '/restaurants'
				click_link 'Add a restaurant'
				fill_in 'Name', with: 'KFC'
				click_button 'Create Restaurant'
				expect(page).to have_content 'KFC'
				expect(current_path).to eq '/restaurants'
			end 
		end

		context 'with a restaurant name that is too short' do 
			it 'it does not let the user submit the invalid name' do
				visit '/restaurants'
				click_link 'Add a restaurant' 
				fill_in 'Name', with: 'kf'
				click_button 'Create Restaurant'
				expect(page).not_to have_css 'h2', text: 'kf'
				expect(page).to have_content 'error'
			end
		end

		context 'and uploading a restaurant image' do 
			it 'if no image is provided, use default' do
		      visit '/restaurants'
		      click_link 'Add a restaurant'
		      fill_in 'Name', with: 'Polpo'
		      click_button 'Create Restaurant'
		      expect(page).to have_selector("img[src$='missing.png']")
			end

			it 'if an image is provided, display that' do 
     			 visit '/restaurants'
		      	click_link 'Add a restaurant'
		      	fill_in 'Name', with: 'McQueens'
		      	# click_link "Choose File"
		      	attach_file "Choose File", '/public/images/tester.png'
		      	# post "/Choose File/", "file" => Rack::Test::UploadedFile.new("app/public/images/tester.png", "mime/type")
		      	click_button 'Create Restaurant'
		      	expect(page).to have_selector("img[src$='tester.png']")
			end 


		end
		
	end