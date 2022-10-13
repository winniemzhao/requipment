class EquipmentController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @equipment = Equipment.all
  end

  def show
    @current_equipment = Equipment.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  def my_offerings
    # equipment where user == current_user
    # @my_offerings = Equipment.where(user.id = current_user)
  end
end
