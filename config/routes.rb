Rails.application.routes.draw do
  devise_for :users
  root to: "texts#index"
  resources :users
    resources :texts do
    collection do
      get 'search' #=> 'texts#search'
    end
  end
end
