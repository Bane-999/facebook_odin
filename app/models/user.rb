class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :friend_requests
         has_many :requests, foreign_key: "request_id", class_name: "FriendRequest"
         has_many :friendships
         has_many :friends, foreign_key: "friend_id", class_name: "Friendship"
         has_many :messages
         has_many :likes, dependent: :destroy
         has_many :comments, dependent: :destroy
end
