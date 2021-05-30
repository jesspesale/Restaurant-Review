class Restaurant < ApplicationRecord
    has_many :reviews
    belongs_to :cuisine #gives .cuisine and .cuisine= methods
    accepts_nested_attributes_for :cuisine
    #allows you to save the new cuisine in the db through restaurants
    has_many :users, through: :reviews

    validates :restaurant_name, presence: true
end
