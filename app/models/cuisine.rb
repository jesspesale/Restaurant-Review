class Cuisine < ApplicationRecord
    
    has_many :restaurants, dependent: :destroy

    validates :name, uniqueness: true

    @cuisines = ["Mexican", "Asian", "Italian", "American", "Seafood", "Other"]
end
