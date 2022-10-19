class User < ApplicationRecord
    validates :password, presence: true, confirmation: true
    has_many :tweets, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :like_tweets, through: :likes, source: :tweet
    
    attr_accessor :password, :password_confirmation
    
    def password=(value)
        if value.present?
            self.pass = BCrypt::Password.create(value)
        end
        @password=value
    end
end
