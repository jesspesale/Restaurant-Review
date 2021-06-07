class Restaurant < ApplicationRecord
    belongs_to :cuisine #gives .cuisine and .cuisine= methods
    # accepts_nested_attributes_for :cuisine
    #allows you to save the new cuisine in the db through restaurants
    # creates a cuisine_attributes=(attr) method
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews #people who have reviewd it

    validates :restaurant_name, presence: true
    validates :cuisine, presence: true

    scope :high_rated, -> {where("review.rating > 3")}


    def average_rating
        if self.reviews.count == 0
            "No reviews"
        else
            self.reviews.average(:rating).to_f.round(2)
        end
    end

    # def cuisine_attributes=(attr)
    #     #find or create a cuisine with the name thats passed in
    #     self.cuisine = Cuisine.find_or_create_by(name: attr[:name])
    #     # associate the cuisine with the restaurant
    # end


end
