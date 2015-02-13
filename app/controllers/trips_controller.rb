class TripsController < ApplicationController
  
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find_by(id: params["id"])
    #@user = User.find_by(id: @trip.user_id)
    #@city = City.find_by(id: @trip.city_id)
    @locations = Location.where(trip_id: @trip.id)
  end

  def new
    @trip = Trip.new
  end

  def create
    trip_params = params.require(:trip).permit(:name, :duration, :season)
    Trip.create(trip_params)
    redirect_to trips_path
  end

  def edit
    @trip = Trip.find_by(id: params["id"])
  end

  def update
    trip_params = params.require(:trip).permit(:name, :duration, :season)
    @trip = Trip.find_by(id: params["id"])
    @trip.update(trip_params)
    redirect_to trips_path
  end

  def destroy
    @trip = Trip.find_by(id: params["id"])
    @trip.destroy
    redirect_to trips_path
  end

end