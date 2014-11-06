require 'rails_helper'

describe 'Viewing restaurants:' do 

	before do
		test_user = User.create(email: "sean@makers.com", password: "12345678", password_confirmation: "12345678")
    	login_as test_user
	end

	context 'When no restaurants have been added' do 

		it 'should display a prompt to add a restaurant' do 
			visit '/restaurants'
			expect(page).to have_content('No restaurants') 
			expect(page).to have_link('Add a restaurant')
		end 
	end

	context 'When restaurants have already been added' do 

		before do 
			@kfc = Restaurant.create(name: 'KFC') 
		end

		it'the restaurants should be displayed' do 
			Restaurant.create(name: 'KFC')
			visit '/restaurants'
			expect(page).to have_content('KFC')
			expect(page).not_to have_content('No restaurants yet')
		end 

		it 'lets a user view a restaurants page' do 
			visit '/restaurants' 
			click_link 'KFC' 
			expect(page).not_to have_content('No restaurants')
			expect(page).to have_content('KFC')
			expect(current_path).to eq "/restaurants/#{@kfc.id}"
		end
	end

	context 'average ratings' do 
		
		before do
			Restaurant.create(name: 'KFC', id: 1)
			Review.create(thoughts: 'test review thought 1', rating: 3, restaurant_id: 1, user_id: 1)
			Review.create(thoughts: 'test review thought 2', rating: 5, restaurant_id: 1, user_id: 2)
		end

		it 'displays an average rating for all reviews' do
		  	visit '/restaurants'
		  	expect(page).to have_content("test review thought 1")
			expect(page).to have_content("Average rating: ★★★★☆")
		end

	end

end




