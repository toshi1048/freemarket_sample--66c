class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def show
  end

  def edit
  end

  def destroy
    # binding.pry
    item = Item.find(params[:id])
    item.destroy  
    #  if item.seller_id == current_user.id
    #   item.destroy
    #  end
   end

private
  
  def item_params
    params.require(:item).permit(:name, :price, :shipping_date, :condition, :delivery_method, :region, :postage).merge(seller_id: current_user.id)
  end
end