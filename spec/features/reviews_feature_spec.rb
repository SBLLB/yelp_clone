require 'rails_helper'

describe 'reviewing' do 

before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    Restaurant.create(name: 'KFC')

  end

	it 'allows users to leave a review via a form' do 
		visit '/restaurants'
		click_link 'Review KFC'
		fill_in "Thoughts", with: "So so"
		select '3', from: 'Rating'
		click_button 'Leave Review'
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content('So so')
	end 
end