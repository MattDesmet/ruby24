Rails.application.routes.draw do

  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular_portfolio_item'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'blogs/topic_id', to: 'blogs#topics'


  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'

end

# Make sure to restart server when changing route.rb file
