class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def new
    @mechanic = Mechanic.new
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def create
    @mechanic = Mechanic.new(mechanic_params)

    if @mechanic.save
      redirect_to mechanics_path
      # redirect_to mechanic_path(@mechanic.id), notice: "Client Created Successfully!"
    else
      render :new
    end
  end

private

  def mechanic_params
    params.require(:mechanic).permit(:name)
  end


end
