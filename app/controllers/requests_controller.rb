class RequestsController < ApplicationController
  before_action :set_equipment, only: %i[new create my_offering_requests edit_offering_request update_offering_request]
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
    if @request.update!(request_params)
      redirect_to my_requests_path, notice: "Your request was successfully updated."
    else
      render :edit, status: 422
    end
  end

  def destroy
    @request.destroy
    redirect_to my_requests_path, status: :see_other, notice: "Your request was successfully deleted."
  end

  def my_requests
    @requests = Request.where(user_id: current_user)
  end

  def my_offering_requests
    @my_offering_requests = Request.where(equipment_id: @equipment)
  end

  def edit_offering_request
  end

  def update_offering_request
    if @request.update!(request_params)
      redirect_to equipment_my_offering_requests_path(@equipment), notice: "You successfully updated the status of the request."
    else
      render :edit, status: 422
    end
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
