class FriendRequestsController < ApplicationController
  before_action :set_friend_request, only: %i[ show edit update destroy ]

  def index
    @friend_requests = current_user.requests
  end


  # POST /friend_requests or /friend_requests.json
  def create
    
    if current_user.id.to_s != friend_request_params[:request_id]
      @friend_request = current_user.friend_requests.new(friend_request_params) 
    else
      @friend_request = current_user.friend_requests.new(user_id: 13)
    end

    respond_to do |format|
      if @friend_request.save  
              
        format.html { redirect_to users_path, notice: "Friend request was successfully created." }        
      else
        format.html { redirect_to users_path, notice: "Friend request was NOT successfully created!" }
      end
    end

  end  

  # DELETE /friend_requests/1 or /friend_requests/1.json
  # def destroy
  #   @friend_request.destroy

  #   respond_to do |format|
  #     format.html { redirect_to friend_requests_url, notice: "Friend request was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_request
      @friend_request = FriendRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_request_params
      params.require(:friend_request).permit(:request_id)
    end
end
