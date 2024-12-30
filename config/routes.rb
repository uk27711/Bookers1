Rails.application.routes.draw do
  get '/top', to: 'homes#top'
  get '/books', to: 'books#new'
  get 'books/index'
  get 'books/:id' => 'books#show'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  get 'home/top' => 'homes#top'
  
  resources :books
  post 'books' => 'books#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
end
