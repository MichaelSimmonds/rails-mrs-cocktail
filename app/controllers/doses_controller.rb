class DosesController < ApplicationController
  before_action :set_cocktail, only: [:create, :new]
  before_action :set_ingredient, only: [:create, :new]

  def new
    @dose = Dose.new
  end

  def create

    @dose = Dose.new(dose_params)
    # params[:dose][:ingredient].to_i!
    p @dose
    @dose.cocktail_id = @cocktail.id
    @dose.save!
    redirect_to '/cocktails'
  end

  def delete
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end


  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_ingredient
    @ingredients = Ingredient.all()
  end

end
