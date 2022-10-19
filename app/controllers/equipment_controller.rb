class EquipmentController < ApplicationController
  before_action :set_equipment, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @equipment = Equipment.all
  end

  def show
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = current_user
    if @equipment.save!
      redirect_to my_offerings_path, notice: "Equipment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @equipment.update!(equipment_params)
      redirect_to equipment_path(@equipment), notice: "Equipment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @equipment.destroy
    redirect_to my_offerings_path, status: :see_other, notice: "Your equipment was successfully deleted."
  end

  def my_offerings
    @my_offerings = Equipment.where(user_id: current_user)
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:title, :category, :product, :population, :condition, :description, :location, :brand, :overall_width, :overall_height, :overall_depth, :back_height, :floor_to_seat_height, :seat_width, :seat_depth, :weight_capacity)
  end
end
