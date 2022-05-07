class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :request, null: false, foreign_key: false

      t.timestamps
    end
    add_foreign_key :friend_requests, :users, column: :request_id
    add_index :friend_requests, [:user_id, :request_id], unique: true
  end
end
