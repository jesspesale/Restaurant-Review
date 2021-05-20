class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.string :address
      t.string :city
      t.string :state
      t.string :category

      t.timestamps
    end
  end
end
