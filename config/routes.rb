Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  
  resources :posts, except: :index
  
  resources :users, only: [] do
    resources :posts, only: :index
  end 

  ##resources :users do
  ##  member do
  ##    get :follow
  ##    get :unfollow
  ##  end
  ##end

  resources :users, only: [] do
    resources :follows, only: [:create, :destroy, :index]
  end 

  resources :posts, only: [] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :update, :destroy]
  end

  get '/posts/index', to: 'posts#index', as: 'user_root_path'

  get '/search', to: 'search#index', as: 'search'

  get '/results/search', to: 'search#show', as: 'search_results'

  root "home#index"

end