class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :request, class_name: "User"
  validates :user_id, uniqueness: {scope: :request_id}
end
