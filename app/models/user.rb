class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    #if a user gets deleted, all reviews associated to them will get deleted as well
    # has_many :reviewed_restaurants, through: :reviews, source: :restaurant
    has_many :restaurants, through: :reviews


    validates :email, uniqueness: true, presence: true
    validates :name, presence: true


    has_secure_password
        # gives us .authenticate method
        # says a validation for password is true
        # validates for password confirmation if there is one (can send in as a params)

end
