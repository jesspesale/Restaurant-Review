class AddCuisineIdToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :cuisine_id, :integer
  end
end
