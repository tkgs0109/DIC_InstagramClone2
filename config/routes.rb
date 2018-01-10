Rails.application.routes.draw do
  root 'welcome#top'
  resources :blogs
  resources :contacts
end
