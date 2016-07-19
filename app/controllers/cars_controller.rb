class CarsController < ApplicationController

  def new
    @client = Client.find(params[:client_id])
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.client_id = params[:client_id]
    if @car.save
      redirect_to client_path(params[:client_id])
      # redirect_to mechanic_path(@mechanic.id), notice: "Client Created Successfully!"
    else
      render :new
    end
  end

private

  def car_params
    params.require(:car).permit(:make, :model, :year, :color, :plate)
  end


end
