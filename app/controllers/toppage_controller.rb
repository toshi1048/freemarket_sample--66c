class ToppageController < ApplicationController
  def index    
    @items = Item.includes(:images).order("created_at DESC").limit(10)
    @ladies        = Item.category(1..200).recent
    @mens          = Item.category(201..345).recent
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
   end


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

