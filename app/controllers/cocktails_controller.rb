class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      # redirect_to @cocktail -> the same as cocktail_path(@cocktail) [show]
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
