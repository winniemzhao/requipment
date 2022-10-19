class RequestsController < ApplicationController
  before_action :set_equipment, only: %i[new create]
  before_action :set_request, only: %i[show edit update destroy edit_offering_request update_offering_request]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.equipment = @equipment
    @request.user = current_user
    @request.request_date = DateTime.now
    if @request.save!
      redirect_to my_requests_path
    else
      render :new, status: 422
    end
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
    @requests = Request.where(user_id: current_user)
  end

  def my_offering_requests

  end

  def edit_offering_request

  end

  def update_offering_request

  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:equipment_id])
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:exchange_availability, :message)
  end
end
