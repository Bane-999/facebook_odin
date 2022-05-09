class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[ show edit update destroy ]

  # GET /friendships or /friendships.json
  def index
    @friendships = current_user.friendships
  end


  # POST /friendships or /friendships.json 
  def create

    @friendship = current_user.friendships.new(friendship_params)
    @friendship2 = User.find(friendship_params["friend_id"]).friendships.new(friend_id: current_user.id)

    respond_to do |format|
      if @friendship.save && @friendship2.save 
        
        FriendRequest.destroy(friend_request_params["id"])        
        
        format.html { redirect_to friend_requests_path, notice: "Friendship was successfully created." }        
      else
        format.html { redirect_to friend_requests_path, notice: "Friendship was NOT successfully created." }
      end
    end
  end


  # # DELETE /friendships/1 or /friendships/1.json
  # def destroy
  #   @friendship.destroy

  #   respond_to do |format|
  #     format.html { redirect_to friendships_url, notice: "Friendship was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friendship_params
      params.require(:friendship).permit(:friend_id)
    end

    def friend_request_params
      params.require(:friendship).permit(:id)
    end
end
