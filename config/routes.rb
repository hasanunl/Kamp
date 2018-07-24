Rails.application.routes.draw do
  get 'welcome/index'
  
  root 'welcome#index'

  get 'search', to: 'articles#index'
  
  resources :articles do
    resources :comments
  end

  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
