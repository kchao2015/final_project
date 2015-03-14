class PacksController < ApplicationController
  before_action :find_trip

  def new
    @pack = Pack.new
  end

  def create
    pack_params = params.require(:pack).permit(:quantity, :item_id)
    @pack = @trip.packs.new(pack_params)
    if @pack.save
      redirect_to @trip, notice: "Item added!"
    else
      render "new"
    end
  end

  def find_trip
    @trip = Trip.find_by(id: params["trip_id"])
  end

end