Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# config/routes.rb
  resources :bands do
   resources :band_memberships, only: [:new, :create, :destroy]
  end
end
