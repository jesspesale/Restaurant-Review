class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :content, :rating, presence: true
  #validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}

  # validates_uniqueness_of :restaurant_id, :scope => :user_id, message: "has already been reviewed by you."
  #validates that a user can only make one review for each restaurant

  #  validates :restaurant, uniqueness: { scope: :user, message: "has already been reviewed by you" }
end

