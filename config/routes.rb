Rails.application.routes.draw do
  get 'homes/top'
  get 'lists/new'
  get 'lists/index'
  get 'lists/show'
  get 'lists/edit'
  
  resources :books
  get 'bppks/new'
  post 'books' => 'books#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'lists/:id' => 'lists#show'
  get '/books', to: 'books#index'
  get "/" => "homes#top"

  
end
