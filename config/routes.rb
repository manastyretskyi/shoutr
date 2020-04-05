Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }

  authenticate :user, lambda { |user| user.admin? } do
    ActiveAdmin.routes(self)
  end
  
  authenticated do
    root to: "dashboards#show"
  end
  
  root to: 'homes#show'

  post 'text_shouts' => "shouts#create", defaults: { content_type: TextShout }
  post 'photo_shouts' => "shouts#create", defaults: { content_type: PhotoShout }
  
  resources :shouts, only: [:show] do
    resources :likes, only: [:index]
    member do
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end

  resource :search, only: [:show]
  resources :hashtags, only: [:show]

  resources :users do
    resources :followers, only: [:index]
    resources :followed_users, only: [:index]
    member do
      post "follow" => "followed_users#create"
      delete "unfollow" => "followed_users#destroy"
    end
  end

end
