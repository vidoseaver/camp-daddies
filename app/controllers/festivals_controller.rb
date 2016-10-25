class FestivalsController < ApplicationController

  def index
    @festivals = Festival.all
  end

  def new
    @festival = Festival.new
  end

  def show
    @festival = Festival.find(festival_id)
  end

  def create
    @festival = Festival.new(festival_params)
    if @festival.save
      redirect_to festival_path(@festival)
    else
      render :new
    end
  end

  def edit
    @festival = Festival.find(festival_id)
  end

  def update
    @festival = Festival.find(festival_id)
    @festival.update_attributes(festival_params)
    redirect_to festival_path(@festival)
  end

  def destroy
    festival = Festival.find(festival_id)
    festival.delete
    redirect_to festivals_path
  end

  private
  def festival_params
      params.require(:festival).permit(:name, :location, :start_date, :end_date, :image_url)
  end

  def festival_id
    params[:id]
  end
end
