class AddRatingScoreToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :rating, :integer
  end
end