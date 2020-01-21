Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
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
      get 'edit'
    end
  end
  resources :items,only:[:index,:new,:create,:show] do
    collection do
      get 'done'
    end
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end

