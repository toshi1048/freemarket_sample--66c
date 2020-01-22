class ItemsController < ApplicationController

  require 'payjp'

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

  def purchase
    Payjp.api_key = "sk_test_e105ebc1622e4c1739841ba7"
    Payjp::Charge.create(
      amount: @item.price, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
    @item.update(buyer_id: current_user_id)
    redirect_to items_path
  end

  def buy_confirmation 
    if @card.present?
      Payjp.api_key =  "sk_test_e105ebc1622e4c1739841ba7"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)    
      @card_brand = @card_information.brand      
      case @card_brand
      when "Visa"
        @card_src = "visa.png"
      when "JCB"
        @card_src = "jcb.png"
      when "MasterCard"
        @card_src = "master-card.png"
      when "American Express"
        @card_src = "american_express.png"
      when "Diners Club"
        @card_src = "dinersclub.png"
      when "Discover"
        @card_src = "discover.png"
      end
      @address = @item.user.address
    end
  end

private
  
  def item_params
    params.require(:item).permit(:name, :price, :shipping_date, :condition, :delivery_method, :region, :postage).merge(seller_id: current_user.id)
  end
end