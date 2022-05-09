class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
    @list = ((current_user.friend_requests.map {|x| x.request_id}) + (current_user.requests.map {|x| x.user_id}) + (current_user.friendships.map {|x| x.friend_id})).uniq  
  end

  

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_user
  #     @user = User.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def user_params
  #     params.fetch(:user, {})
  #   end


end
