class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    @recipe.save
    redirect_to @recipe
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
  end

  def update
  end

  def index
  end

  def destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :serves, :calories, :prepare_time,
                                   :equipment, :ingredients, :directions)
  end

end
