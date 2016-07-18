class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
    @client.cars.build
  end

  def show
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to client_path(@client.id), notice: "Client Created Successfully!"
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :phone, :cedula, cars_attributes: [:make, :model, :year, :color, :plate])
  end
end
