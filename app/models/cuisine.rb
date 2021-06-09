class Cuisine < ApplicationRecord
    
    has_many :restaurants, dependent: :destroy

    validates :name, uniqueness: true

end
