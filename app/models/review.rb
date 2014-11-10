class Review < ActiveRecord::Base

	validates :rating, inclusion: (1..5)
	belongs_to :user
	belongs_to :restaurant
	has_many :endorsements

 	validates :user_id, uniqueness: { scope: :restaurant_id,
    message: "You have already reviewed this restaurant" }

end
