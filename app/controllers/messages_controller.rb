class MessagesController < ApplicationController
  def index
    @message = Message.new
    @post = Post.find(params[:post_id])
    @messages = @post.messages.includes(:user)
  end

  def create
    @post = Post.find(params[:post_id])
    @message = @post.messages.new(message_params)
    if @message.save
      redirect_to post_messages_path(@post)
    else
      @messages = @post.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
