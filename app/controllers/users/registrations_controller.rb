class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def new
    @user = User.new
  end

  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token.first(7)
      params[:user][:password] = pass
      @user = User.new(sign_up_params)
    else
      @user = User.new(sign_up_params)
    end
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @phone_number = @user.build_phone_number
    @address = @user.build_address
    @card = @user.build_card
    render :new_tel
  end

  def create_tel
    @user = User.new(session["devise.regist_data"]["user"])
    @phone_number = PhoneNumber.new(tel_params)
    unless @phone_number.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new_tel and return
    end
      session["phone_number"] = {phone_number: @phone_number.attributes}
      session["phone_number"][:phone_number]= params[:phone_number]
      @address = Address.new
      render :new_address
    end

  
  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @phone_number = PhoneNumber.new(session["phone_number"]["phone_number"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    session["address"] = {address: @address.attributes}
    session["address"][:address]= params[:address]
    render :new_card
  end
  

  def create_card
    @user = User.new(session["devise.regist_data"]["user"])
    @phone_number = PhoneNumber.new(session["phone_number"]["phone_number"])
    @address = Address.new(session["address"]["address"])
    @card = Card.new(card_params)
    unless @card.valid?
      flash.now[:alert] = @card.errors.full_messages
      render :new_card and return
    end
    @user.build_phone_number(@phone_number.attributes)
    @user.build_address(@address.attributes)
    @user.build_card(@card.attributes)
    @user.save
    sign_in(:user, @user)
    render :complete
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end
  def tel_params
    params.require(:phone_number).permit(:phone_number)
  end

  def address_params
    params.require(:address).permit(:zipcode, :prefecture,:first_address,:second_address,:third_address)
  end
  
  def card_params
    params.require(:card).permit(:card_number, :year, :momth, :security_number)
  end
end

