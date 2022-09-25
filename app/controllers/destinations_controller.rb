class DestinationsController < ApplicationController
  def edit
  end

  def update
  end

  def show
    @destination = Destination.find(params[:id])
  end
  
  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    redirect_to root_path
  end

  def index
    @destinations = Destination.all

  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def destination_params
      params.require(:destination).permit(:month, :long_distance, :middle_distance, :short_distance, :user_id )
    end

end
