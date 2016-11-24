class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cockail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

    def edit
    end

    def update
      if @cocktail.update(coctail_params)
        redirect_to cocktail_path(@restaurant)
      else
        render :edit
      end
    end
    def destroy
      @restaurant.destroy
      redirect_to cocktailss_path
    end


    private

    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    def cocktail_params
      params.require(:cocktail).permit(:name)
    end
  end
