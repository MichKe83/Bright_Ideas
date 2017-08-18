Rails.application.routes.draw do
root "users#index"

  get 'register' => 'users#new'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show', as: :user
  get 'users/:id/info' => 'users#info'
  patch "users/:id" => "users#update"
  get 'users/:id/edit' => "users#edit"
  delete "users/:id" => "users#destroy"

  get 'ideas/:id' => 'ideas#index'
  post 'ideas/new' => 'ideas#create'
  delete 'ideas/:id' => 'ideas#destroy'

  post 'likes/:id' => 'likes#create'
  delete 'likes/:id' => 'likes#destroy'


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end
