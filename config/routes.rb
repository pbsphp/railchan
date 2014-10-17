Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :boards, path: "/" do
    resources :topics do
      resources :comments
    end
  end


  resources :comments, only: [ :show ]


  root "boards#index"

end
