class Restaurant < ApplicationRecord
    belongs_to :cuisine #gives .cuisine and .cuisine= methods
    accepts_nested_attributes_for :cuisine
    #allows you to save the new cuisine in the db through restaurants
    # creates a cuisine_attributes=(attr) method
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews #people who have reviewd it

    validates :restaurant_name, presence: true
    validates :cuisine, presence: true

    def cuisine_attributes=(attr)
        # byebug
        #find or create a cuisine with the name thats passed in
        self.cuisine = Cuisine.find_or_create_by(name: attr[:name])
        # associate the cuisine with the restaurant
    end


end
