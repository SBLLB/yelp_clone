class RemoveRatingFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :rating
  end
end
