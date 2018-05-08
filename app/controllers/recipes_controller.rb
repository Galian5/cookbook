class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])

    @recipe.save
    redirect_to @recipe
  end

  def show
  end

  def edit
  end

  def update
  end

  def index
  end

  def destroy
  end

end
