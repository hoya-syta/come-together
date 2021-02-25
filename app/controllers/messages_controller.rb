class MessagesController < ApplicationController
    def create
      @message = Message.new(message_params)
      if @message.save
        redirect_to post_path(@message.post)
      else
        @post = @message.post
        @messages = @post.messages
        render "post/show"
      end
    end
  
    private
  
    def message_params
      params.require(:message).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
    end
  end
