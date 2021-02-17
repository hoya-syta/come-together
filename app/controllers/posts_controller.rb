class PostsController < ApplicationController

  def index
  end
  
end


private

  def post_params
    params.require(:post).permit(:title, :detail :image).merge(user_id: current_user.id)
  end