class AddCuisineToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :cusisine, :string
  end
end
