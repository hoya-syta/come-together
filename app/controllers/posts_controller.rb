class PostsController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]
  


  def index
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end


end


private

  def post_params
    params.require(:post).permit(:title, :detail, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
