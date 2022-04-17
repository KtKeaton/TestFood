class RecipesController < ApplicationController

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
      render :new, notice: "FAILED!"
    end
  end

private

  def recipe_params
    params.require(:recipe).permit(:title, :money)
  end

end
