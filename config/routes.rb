Rails.application.routes.draw do

root 'stories#index'

# Fork stories routes
get 'stories/new_fork' => 'stories#new_fork'
post 'stories/create_new_fork' => 'stories#create_new_fork'

resources :users
resources :stories do
  resources :comments
end


# Logout route
get '/logout' => 'sessions#destroy'
resources :sessions, only: [:new, :create]

get '*path' => redirect('/')

end
