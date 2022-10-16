Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  get '/posts/new', controller: 'posts', action: 'new', as: :new_post
  post '/posts', controller: 'posts', action: 'create', as: :posts
  get '/posts/:id', controller: 'posts', action: 'show', as: :post
  get '/posts/:id/edit', controller: 'posts', action: 'edit', as: :edit_post
  patch '/posts/:id', controller: 'posts', action: 'update', as: false
  delete 'posts/:id', controller: 'posts', action: 'destroy', as: false

  # comments

  post '/comments', controller: 'comments', action: 'create', as: :comments
  get '/comments/:id', controller: 'comments', action: 'show', as: :comment
  patch '/comments/:id/edit', controller: 'comments', action: 'update', as: false
  delete '/comments/:id', controller: 'comments', action: 'destroy', as: false


  namespace :api, default: { format: :json } do
    get '/posts', controller: :posts, action: :index
    get '/posts/:id', controller: :posts, action: :show
  end
end
