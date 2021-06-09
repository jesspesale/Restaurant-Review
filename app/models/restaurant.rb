class Restaurant < ApplicationRecord
    belongs_to :cuisine   # .cuisine and .cuisine= methods

    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews 

    validates :restaurant_name, presence: true
    # validates :cuisine_id, presence: true

end
