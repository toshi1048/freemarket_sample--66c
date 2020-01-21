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

  def pay
    Payjp.api_key = 'sk_test_e105ebc1622e4c1739841ba7'
    Payjp::Charge.create(
      amount: 3500,
      card: params['payjp-token']
      current: 'jpy'
    )
  end



private
  
  def item_params
    params.require(:item).permit(:name, :price, :shipping_date, :condition, :delivery_method, :region, :postage).merge(seller_id: current_user.id)
  end
end