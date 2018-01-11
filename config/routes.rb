Rails.application.routes.draw do
  root 'welcome#top'
  resources :blogs
  resources :contacts
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
