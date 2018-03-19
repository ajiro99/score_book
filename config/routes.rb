Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'score_books#index'
  get 'score_books/:id' => 'score_books#game_detail'

  namespace :admin do
  	resources :games
  	resources :results
  end
end
