class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params["id"])
  end

  def new
    @item = Item.new
  end

  def create
    item_params = params.require(:item).permit!
    @item = Item.create(item_params)
      if @item.valid?
        redirect_to items_path
      else
        render text: "FAIL"
      end
  end


  def edit
    @item = Item.find_by(id: params["id"])
  end

  def update
    item_params = params.require(:item).permit!
    @item = Item.find_by(id: params["id"])
    @item.update(item_params)
    redirect_to items_path
  end

  def destroy
    @item = Item.find_by(id: params["id"])
    @item.destroy
    redirect_to items_path
  end

end