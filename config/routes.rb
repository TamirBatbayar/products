Rails.application.routes.draw do
  resources :sales
  resources :suppliers
  resources :products do
  	collection {post :import}
  end
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  # get 'products_search' => 'products#search', as: :search
  get 'import_page' => 'products#import_page', as: :import_page
  post 'import' => 'products#import', as: :import
  get 'import' => 'products#import', as: :import_show
end
