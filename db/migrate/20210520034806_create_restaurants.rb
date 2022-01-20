class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.text :restaurant_name
      t.text :address
      t.text :city
      t.text :state
      t.text :cuisine
      t.integer :user_id
      t.integer :cuisine_id

      t.timestamps
    end
  end
end
