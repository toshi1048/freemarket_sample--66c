class ToppageController < ApplicationController
  def index
    @ladies        = Item.where(category_id:  1..200).recent
    @mens          = Item.where(category_id:201..345).recent
    @kids          = Item.where(category_id:346..480).recent
    @interior      = Item.where(category_id:481..624).recent
    @game          = Item.where(category_id:625..684).recent
    @hobby         = Item.where(category_id:685..797).recent
    @cosmetics     = Item.where(category_id:798..897).recent
    @electronics   = Item.where(category_id:898..983).recent
    @sports        = Item.where(category_id:984..1000).recent
    @chanel        = Item.where(brand_id:1).recent
    @louis_vuitton = Item.where(brand_id:2).recent
    @supreme       = Item.where(brand_id:3).recent
    @nike          = Item.where(brand_id:4).recent
  end
  
  def show
  end
end