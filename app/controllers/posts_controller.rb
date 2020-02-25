class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def myindex
    @posts = Post.all
    if current_user != nil
      @posts = Post.where('user_id== ?', current_user.id).order(:id)
    end
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, success: 'Post successfully created'
    else
      render :new, danger:  'Post not created'
    end
  end

  def edit
  end

  def update
    if @post.user_id == current_user.id && @post.update(post_params)
      redirect_to @post, success: 'Post successfully updated'
    else
      render :edit, danger:  'Post not updated'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Post successfully deleted'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :summary, :body, :image)
  end

end
