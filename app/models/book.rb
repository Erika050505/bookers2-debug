class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :comments
	validates :title, presence: true
	 validates :body, presence: true, length: {maximum: 200}
    def favorite_user(user_id)
     favorites.find_by(user_id: user_id)
    end
end