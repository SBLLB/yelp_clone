require 'rails_helper' 

describe 'Users on the site' do 

  context "when NOT signed in and on the homepage" do 

  	it "should see a 'sign in' and a 'sign up' link" do 
  		visit ('/')
  		expect(page).to have_link('Sign in')
  		expect(page).to have_link('Sign up')
  	end

  	it "should not see a 'sign out' link " do
  		visit('/')
  		expect(page).not_to have_link('Sign out')
  	end

      it "should not be able to create a restaurant" do
      visit('/')
      click_link('Add a restaurant')
      expect(page).to have_content('Log in')
      
    end

  end

  context "when signed in on the homepage" do

    before do
      test_user = User.create(email: "sean@makers.com", password: "12345678", password_confirmation: "12345678")
      login_as test_user
    end

    it "should see a 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

  end
end



