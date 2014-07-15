class PostsController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 6).order('created_at desc')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new (post_params)
    if @post.save
      flash[:notice] = 'New post was created'
      redirect_to posts_path
    else
      flash[:error] = 'Post could not be created'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post successfully updated'
      redirect_to post_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'The post was deleted'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, category_ids: [])
  end

  def set_post
    @post = Post.find_by(slug: params[:id])
  end
end