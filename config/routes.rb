Rails.application.routes.draw do
  resources :sentences
  root 'welcome#index'
end