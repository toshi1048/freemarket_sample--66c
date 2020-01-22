class ItemsController < ApplicationController
  before_action :set_category, only: [:new, :create]

  require 'payjp'


  def index
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
      redirect_to new_item_path
    end
  end

  def show
  end

  def purchase
  end
  

  def pay
    Payjp.api_key = "sk_test_e105ebc1622e4c1739841ba7"
    Payjp::Charge.create(
      amount: 11111, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
    redirect_to action: :done
  end


  def done
  end

  def purchase
  end

private
  
  def item_params
    params.require(:item).permit(:name,:detail,:brand_id, :price, :shipping_date,:condition,:image, :delivery_method, :region, :postage,:category_id, images_attributes: [:image]).merge(saler_id: current_user.id,buyer_id: nil)
  end

  def set_category
    @category_parent_array = []
      Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent
  end
  end
end