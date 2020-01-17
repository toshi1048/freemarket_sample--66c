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
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
    @image = Image.find(params[:id])
    @brand = Brand.find(params[:id])
  end

private
  
  def item_params
    params.require(:item).permit(:name, :price, :shipping_date, :condition, :delivery_method, :region, :postage).merge(seller_id: current_user.id)
  end

  def usre_params
    params.require(:user).permit(:email, :encrypted_password, :nickname,:first_name, :last_name, :first_name_rattle,:birthyear,:birthmonth,:birthday, :introduction,:image,)
  end

  def image_params
    params.require(:image).premit(:item_id,:created_at,:updated_at)
  end

  def brand_params
    params.premit(:id,:name)
  end
end