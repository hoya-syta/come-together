class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  


  def index
    @posts = Post.all
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

  def show
    @message = Message.new
    @messages = @post.messages
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    render :show if current_user != @post.user
    redirect_to root_path if @post.destroy
  end


end


private

  def post_params
    params.require(:post).permit(:title, :detail, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @post.user
  end
