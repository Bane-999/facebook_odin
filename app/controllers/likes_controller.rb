class LikesController < ApplicationController

    def create 
        @like = current_user.likes.new(like_params)
        if !@like.save
            flash[:notice] = @like.errors.full_messages.to_sentence
        end
        redirect_to messages_path
    end

    private

    def like_params
        params.require(:like).permit(:message_id)
    end
end
