class RecipeEquipmentsController < ApplicationController
  def new
    @search_bar_hide = true
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_equipment = RecipeEquipment.new
  end

  def create
    selected_equipments = params[:recipe_equipment][:equipment_id]
    selected_equipments.each do |equipment|
      if equipment != ""
        selected_equipment = { "equipment_id" => equipment }
        @recipe_equipment = RecipeEquipment.new(selected_equipment)
        @recipe = Recipe.find(params[:recipe_id])
        @recipe_equipment.recipe = @recipe
        @recipe_equipment.save
      end
    end
    redirect_to edit_recipe_path(@recipe)
  end
end
