class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    # @items = user.items.page(params[:page]).per(5).order("created_at DESC")
  end

  def edit
  end

  def signout
  end
  
  def identification
    @address = Address.all
  end
  
end
