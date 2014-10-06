class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  after_action :create_activity, only: [:create, :update, :destroy]
  
  def index
    @blogs = Blog.all.page(params[:page]).per(20)
    respond_with @blogs
  end

  def show
    respond_with @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(permitted_params)
    @blog.user = current_user
    @blog.save
    respond_with @blog
  end

  def update
    respond_with @blog = Blog.update(params[:id], permitted_params)
  end

  def destroy
    respond_with Blog.destroy(params[:id])
  end
  
  private 
  def permitted_params
      params.require(:blog).permit(*permitted_blog_attributes)
  end

  def create_activity
    feed_activity @blog
  end
end
