class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :content, :rating, presence: true

  scope :high_rated, -> {where("rating > 3")}

end

