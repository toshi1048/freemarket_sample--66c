class ItemsController < ApplicationController
  before_action :set_category, only: [:new, :create]

  def index
    @items = Item.includes(:images).limit(1)
  end

  def new
    @item = Item.new
    @item.images.new

    def get_category_children
      @category_children = Category.find_by("#{params[:parent_name]}", ancestry: nil).children
    end
  
    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
    @brand = Brand.find(params[:id])
    @items = Item.includes(:images).order("created_at DESC")
    @category = Item.includes(:categories)
  end

private
  
  def item_params
    params.require(:item).permit(:name,:detail,:brand_id, :price, :shipping_date,:condition,:image, :delivery_method, :region, :postage,:category_id, images_attributes: [:image]).merge(saler_id: 1,buyer_id: 2)
  end

  def usre_params
    params.require(:user).permit(:email, :encrypted_password, :nickname,:first_name, :last_name, :first_name_rattle,:birthyear,:birthmonth,:birthday, :introduction,:image,)
  end

  def brand_params
    params.premit(:id,:name)
  end

  def set_category
    @category_parent_array = []
      Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent
  end
end