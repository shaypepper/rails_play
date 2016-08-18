Rails.application.routes.draw do
  root "sessions#index"
  get "users/:id/edit" => "users#edit"
  post "users" => "users#create"
  post "users/:id" => "users#update"
  post "comments" => "comments#create"

  post "attendees" => "attendees#create"
  delete "attendees/:id" => "attendees#destroy"

  get "events" => "events#index"
  post "events" => "events#create"
  get "events/:id/edit" => "events#edit"
  get "events/:id/" => "events#show"
  post "events/:id" => "events#update"
  delete "events/:id" => "events#destroy"

  post "login" => "sessions#login"
  get "logout" => "sessions#logout"
end
