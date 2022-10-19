class Tweet < ApplicationRecord
    validates :message ,presence: true ,length: { maximum: 140 }
    has_many :likes, dependent: :destroy
    has_many :like_users, through: :likes, source: :user
    
    def islike(usr)
        like_users.include?(usr)
    end
end
