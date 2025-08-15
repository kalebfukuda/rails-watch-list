Rails.application.routes.draw do
  root "lists#index"
  resources :lists, only: [:index, :show, :create] do
    resources :bookmarks, only: [:create]
  end
  resources :bookmarks, only: [:destroy]
end
