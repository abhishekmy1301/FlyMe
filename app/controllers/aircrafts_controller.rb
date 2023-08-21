class AircraftsController < ApplicationController
  before_action :set_aircraft, only: [:show, :edit, :update, :destroy]

  def index
    @aircrafts = Aircraft.all
  end

  def show
    @aircraft = set_aircraft
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
    @aircraft = set_aircraft
  end

  def update
    @aircraft = set_aircraft
    @aircraft.update(aircraft_params)
    redirect_to aircraft_path(aircraft)
  end

  def destroy
    @aircraft = set_aircraft
    @aircraft.destroy
    redirect_to aircrafts_path, status:  :see_other
  end

  private

  def aircraft_params
    params.require(:aircraft).permit(:model, :description, :capacity, :price)
  end

  def set_aircraft
    @aircraft = Aircraft.find(params[:id])
  end
end
