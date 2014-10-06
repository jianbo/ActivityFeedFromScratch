class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  after_action :create_activity, only: [:create, :update, :destroy]
  
  def index
    @blogs = Recipe.all.page(params[:page]).per(20)
    respond_with @blogs
  end

  def show
    respond_with @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(permitted_params)
    @recipe.user = current_user
    @recipe.save
    respond_with @recipe
  end

  def update
    respond_with @recipe = Recipe.update(params[:id], permitted_params)
  end

  def destroy
    respond_with Recipe.destroy(params[:id])
  end
  
  private 
  def permitted_params
      params.require(:recipe).permit(*permitted_recipe_attributes)
  end

  def create_activity
    feed_activity @recipe
  end
end