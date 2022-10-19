class RequestsController < ApplicationController
  before_action :set_equipment, only: %i[new create]
  before_action :set_request, only: %i[show edit update destroy my_requests my_offering_requests edit_offering_request update_offering_request]

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  def my_requests
    # @my_requests = Request.where(user.id = current_user)
  end

  def my_offering_requests

  end

  def edit_offering_request

  end

  def update_offering_request

  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:status, :request_date, :exchange_availbility, :exchange_date, :message)
  end
end
