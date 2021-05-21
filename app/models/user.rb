class User < ApplicationRecord
    has_many :reviews
    has_many :restaurants, through: :reviews

    validates :email, uniqueness: true, presence: true

    has_secure_password
        # gives us .authenticate method
        # says a validation for password is true
        # validates for password confirmation if there is one (can send in as a params)

end
