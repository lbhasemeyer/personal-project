Rails.application.routes.draw do

  resources :users
  resources :private_maps
  resources :public_maps

  root "pages#index"
  get "/about" => "pages#about", as: :about
  get "/contact" => "pages#contact", as: :contact

  get "/signup" => "registrations#new", as: :signup
  post "/signup" => "registrations#create"
  get "/signin" => "authentication#new", as: :signin
  post "/signin" => "authentication#create"
  get "/signout" => "authentication#destroy", as: :signout

  get "/countries" => "countries#index"

  get "/clicked" => "private_maps#clicked"
  post "/clicked" => "private_maps#clicked"

  post "/visits" => "visits#create"

end
