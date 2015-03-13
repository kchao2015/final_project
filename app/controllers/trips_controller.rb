class TripsController < ApplicationController
  
  def index
    @trips = current_user.trips
  end

  def show
    @trip = Trip.find_by(id: params["id"])
    #@user = User.find_by(id: @trip.user_id)
    #@city = City.find_by(id: @trip.city_id)
    #@season = Season.find_by(id: @trip.season_id)
  end

  def new
    @trip = Trip.new
  end

  def create
    trip_params = params.require(:trip).permit(:name, :city_id, :duration, :season_id)
    #@trip = Trip.create(trip_params)
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trips_path
    else
      render text: "FAIL"
    end
  end

  def edit
    @trip = Trip.find_by(id: params["id"])
  end

  def update
    trip_params = params.require(:trip).permit(:name, :city_id, :duration, :season_id, :user_id)
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