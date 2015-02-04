class TripsController < ApplicationController
  
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find_by(id: params["id"])
    @user = User.find_by(id: @trip.user_id)
    @city = City.find_by(id: @trip.city_id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end