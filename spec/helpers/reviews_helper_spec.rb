require 'rails_helper'

describe ReviewsHelper, :type => :helper  do

	context 'star rating' do 
		it 'does nothing for a non number' do 
			expect(helper.star_rating('N/A')).to eq('N/A')
		end

		it 'displays five black stars for a rating of 5' do 
			expect(helper.star_rating(5)).to eq('★★★★★')
		end

		it 'displays three black stars and two white for rating of 3' do 
			expect(helper.star_rating(3)).to eq('★★★☆☆')
		end
	end

end	