class RecipesController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create]

  def index
    @recipes = Recipe.all  
  end

  def new
    @recipe = Recipe.new  
  end

  def create
    @recipe = Recipe.new(recipe_params)
    
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
