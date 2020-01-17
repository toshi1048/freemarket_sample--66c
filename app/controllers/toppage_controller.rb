class ToppageController < ApplicationController
  def index
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
end