Rails.application.routes.draw do
  resources :videos
  get 'courses/', to: 'courses#index'
  get 'courses/new'
  post 'courses', to: 'courses#create'
  get 'courses/:id', to: 'courses#show', as: 'show_course' 
  get 'courses/:id/edit', to: 'courses#edit', as: 'edit_course' 
  patch 'courses/:id/',  to: 'courses#update', as: 'course'
  delete 'course/:id', to: 'courses#destroy', as: 'delete_course'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
