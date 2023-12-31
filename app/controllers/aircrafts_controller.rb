class AircraftsController < ApplicationController
  before_action :set_aircraft, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
    if params[:query].present?
      @query = params[:query]
      @aircrafts = Aircraft.where("model LIKE ?", "%#{params[:query]}%")

      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @aircrafts = Aircraft.all
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @aircraft = Aircraft.new
  end

  def create
    @aircraft = Aircraft.new(aircraft_params)
    @aircraft.user = current_user
    @aircraft.save
    redirect_to aircraft_path(@aircraft)
  end

  def edit
  end

  def update
    if @aircraft.update(aircraft_params)
      redirect_to aircraft_path(@aircraft)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @aircraft.destroy
    redirect_to aircrafts_path, status:  :see_other
  end

  private

  def aircraft_params
    params.require(:aircraft).permit(:model, :description, :capacity, :price, :picture_url)
  end

  def set_aircraft
    @aircraft = Aircraft.find(params[:id])
  end
end
