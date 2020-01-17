Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'phone_numbers', to: 'users/registrations#create_tel'
    post 'addresses', to: 'users/registrations#create_address'
    post 'cards', to: 'users/registrations#create_card'


  end
  root "toppage#index"
  # 後にこちらのビューファイルと紐付けます。
  # resources :signup do
  #   collection do
  #     get 'information'
  #     get 'authentication'
  #     get 'address'
  #     get 'payment'
  #     get 'done'
  #   end
  # end
  resources :mypages,only:[:index,:edit] do
    collection do
      get 'card'
      get 'signout'
      get 'identification'
    end
  end
  resources :items,only:[:index,:new,:create,:show]
end

