Rails.application.routes.draw do
  get 'webs/index'
  get 'webs/green'
  get 'webs/indeed'
  get 'webs/test'
  get 'shops/index'
  get 'shops/new'
  resources :vehicles do
    match '/scrape', to: 'vehicles#scrape', via: :post, on: :collection
  end

  root to: 'vehicles#index'
end
