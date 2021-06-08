class Restaurant < ApplicationRecord
    belongs_to :cuisine #gives .cuisine and .cuisine= methods
    # accepts_nested_attributes_for :cuisine

    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews #people who have reviewd it

    validates :restaurant_name, presence: true
    validates :cuisine, presence: true

    # scope :high_rated, -> {where("#{review.rating} > 3")}



    def average_rating
        if self.reviews.count == 0
            "No reviews"
        else
            self.reviews.average(:rating).to_f.round(2)
        end
    end



end
