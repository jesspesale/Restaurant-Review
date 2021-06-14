class User < ApplicationRecord
    has_many :reviews
    has_many :restaurants, through: :reviews


    validates :email, uniqueness: true, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
    validates :name, presence: true


    has_secure_password
        # says a validation for password is true
        # validates for password confirmation if there is one (can send in as a params)


    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(10)
        end
    end

end
