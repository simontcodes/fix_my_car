class ClientsController < ApplicationController
  def index
    @clients = Client.all.order("name").page(params[:page]).per_page(4)
  end

  def new
    @client = Client.new
    @client.cars.build
  end

  def show
    @client = Client.find(params[:id])
    @cars = @client.cars

    respond_to do |format|
      format.html
      format.json { render json: @cars }
    end
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to client_path(@client.id), notice: "Client Created Successfully!"
    else
      render :new
    end
  end

  def edit
    @client = Client.find_by(id: params[:id])
  end

  def destroy
        @client = Client.find_by(id: params[:id])
        @client.destroy
        redirect_to clients_path
      end

  def update
    @client = Client.find(params[:id])
      if @client.update_attributes(client_params)
        redirect_to client_path(@client)
      else
        render :edit
      end
  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :phone, :cedula, cars_attributes: [:make, :model, :year, :color, :plate])
  end
end
