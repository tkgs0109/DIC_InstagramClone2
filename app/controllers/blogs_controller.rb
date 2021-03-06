class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :login_confirm, only: [:new, :edit, :show, :destroy]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      BlogMailer.blog_mail(@blog).deliver
      redirect_to blogs_path, notice: "投稿が完了しました"
    else
      render 'new'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "投稿を編集しました!"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "投稿を削除しました!"
  end

  private
  def blog_params
    params.require(:blog).permit(:image, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def login_confirm
    unless logged_in? then
      redirect_to new_session_path
    end
  end
end
