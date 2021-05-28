class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :restaurant_name, presence: true
end
