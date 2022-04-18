class RecipesController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create]

  def index
    @recipes = current_user.recipes.order(id: :desc)
  end

  def new
    @recipe = current_user.recipes.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    
    if @recipe.save
      redirect_to recipes_path, notice: "Successful!"
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def recipe_params
    params.require(:recipe).permit(:title, :money)
  end

end
