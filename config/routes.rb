RedditClone::Application.routes.draw do
  root to: "posts#index"

  devise_for :users

  resources :posts, :comments, :votes
end
