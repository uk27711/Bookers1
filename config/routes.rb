Rails.application.routes.draw do
  get '/top', to: 'homes#top'
  get '/books', to: 'books#index'
  get 'books/:id/show' => 'books#show', as: 'show_book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  get 'home/top' => 'homes#top'
  put 'books/:id' =>'books#update'
  delete 'books/:id' => 'books#destroy'
  
  resources :books
  post 'books' => 'books#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
end

