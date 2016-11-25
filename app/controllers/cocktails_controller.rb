class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
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
