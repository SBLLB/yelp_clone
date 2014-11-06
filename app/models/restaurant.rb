

class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :name, length: {minimum: 3}
	belongs_to :user

	def has_been_reviewed_by?(user)
		reviews.find_by user: (user)
	end

	def average_rating
	  return 'N/A' if reviews.none?
		  reviews.inject(0) {|memo, review| memo + review.rating} / reviews.length
	end

end
