class LikesController < ApplicationController

    def create 

        if params[:commit] == "message"

            # 99.times do
            #     puts @message
            # end

            @like = Message.find(like_params["likeable_id"]).likes.new(like_params)

            if !@like.save
                flash[:notice] = @like.errors.full_messages.to_sentence
            end
            redirect_to messages_path

        elsif params[:commit] == "comment"

            @like = Comment.find(like_params["likeable_id"]).likes.new(like_params)
            if !@like.save
                flash[:notice] = @like.errors.full_messages.to_sentence
            end
            redirect_to message_path(id_params["id"])

        end
        
    end

    private

    def like_params
        params.require(:like).permit(:likeable_id, :user_id)
    end

    def id_params
        params.require(:like).permit(:id)
    end

end
