Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#home'
  resources :users
  resources :posts, only: [:new, :create]
  resources :comments, only: [:new, :create]
  get "/profile", to: "profiles#index"


  get "/follower", to: "relationships#follower"
  get "/following", to: "relationships#following"
  get "/search", to: "relationships#search"
  get "/follow", to: "relationships#follow"
  get "/unfollow", to: "relationships#unfollow"
  get "/show_profile", to: "relationships#show_profile"
  get "/user_followers", to: "relationships#user_followers"
  get "/user_following", to: "relationships#user_following"

  get "/likes", to: "likes#like"
  get "/comments", to: "comments#show_comment"

  get "/all_posts", to: "posts#all_posts"

  get "/login", to: "logins#new"
  post "/login", to: "logins#create"
  get "/logout", to: "logins#logout"

  get '/search_user' , to:'searches#search_user', as: :searches_user

end
