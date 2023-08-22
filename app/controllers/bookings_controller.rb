class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
    @aircraft = Aircraft.find(params[:aircraft_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.aircraft = Aircraft.find(params[:aircraft_id])
    @booking.save
    redirect_to booking_path(@booking)
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
    redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:departure_time, :takeoff, :landing)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
