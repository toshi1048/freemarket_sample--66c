class ItemsController < ApplicationController
  before_action :set_category, only: [:new, :create]

  def index
    @items = Item.includes(:images).limit(1)
  end

  def new
    @item = Item.new
    @item.images.new

    def get_category_children
      @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
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
      redirect_to new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images
    @user = User.find(params[:id])
    @brand = Brand.find(params[:id])
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
    params.require(:item).permit(:name,:detail,:brand_id, :price, :shipping_date,:condition,:image, :delivery_method, :region, :postage,:category_id, images_attributes: [:image]).merge(saler_id: current_user.id,buyer_id: nil)
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
end