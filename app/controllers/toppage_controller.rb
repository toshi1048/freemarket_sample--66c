class ToppageController < ApplicationController
  def index    
    @items = Item.includes(:images).order("created_at DESC").limit(10)
    @ladies        = Item.category(1..199).recent
    @mens          = Item.category(200..345).recent
    @kids          = Item.category(346..480).recent
    @interior      = Item.category(481..624).recent
    @game          = Item.category(625..684).recent
    @hobby         = Item.category(685..797).recent
    @cosmetics     = Item.category(798..897).recent
    @electronics   = Item.category(898..983).recent
    @sports        = Item.category(984..1000).recent
    @chanel        = Item.brand(1).recent
    @louis_vuitton = Item.brand(2).recent
    @supreme       = Item.brand(3).recent
    @nike          = Item.brand(4).recent
    # @category_parent_array = ["---"]
    # Category.where(ancestry: nil).each do |parent|
    # @category_parent_array << parent.name
    #  Category.where(ancestry: nil).each do |item|
    # @item = item.name
   end



   
    # @tempitems3 = Product.where(id: @tempitems2.map{ |item| item.id })
    # @products1 = @tempitems3.order("created_at DESC").first(4)
    # 元々
    # @category1 = Category.find(1)
    # @products1 = @category1.products.recent

    # @tempitems4 = []
    # @category2 = Category.find(15,16,17,18,19,20,21,22,23,24,25,26,27,28)
    # @category2.map{|category| @tempitems4 << category.products}
    # @tempitems5 = @tempitems4.flatten
    # @tempitems6 = Product.where(id: @tempitems5.map{ |item| item.id })
    # @products2 = @tempitems6.order("created_at DESC").first(4)

    # @tempitems7 = []
    # @category3 = Category.find(29,30,31,32,33,34,35,36,37,38,39,40,41)
    # @category3.map{|category| @tempitems7 << category.products}
    # @tempitems8 = @tempitems7.flatten
    # @tempitems9 = Product.where(id: @tempitems8.map{ |item| item.id })
    # @products3 = @tempitems9.order("created_at DESC").first(4)

  # end

  def show
  end



private
  
  def item_params
    params.require(:image).permit(:user_id,:item_id,:created_at)
  end

  def image_params
    parems.repuire(:image).permit(:item_id,:id)
  end
end

