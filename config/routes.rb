Rails.application.routes.draw do
  get 'home/index'
  resources :url_shorts
  devise_for :users
  get '/:id' => "shortener/shortened_urls#show"
  root 'home#index'
  # get 'home/stats',
  get '/home/stats' ,to: 'home#stats'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
