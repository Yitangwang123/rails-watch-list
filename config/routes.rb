Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'lists#index'
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: :create
    resources :reviews, only: :create
  end

  resources :bookmarks, only: [:new, :destroy]
  resources :reviews, only: [:new, :destroy]
end
