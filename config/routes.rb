Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'score_books#index'
  get 'score_books/:id' => 'score_books#game_detail'
  get 'about' => 'score_books#about'
  get 'schedule' => 'score_books#schedule'
  get 'players' => 'score_books#players'


  namespace :admin do
    resources :games
    resources :results
    resources :goal_patterns
    resources :goal_against_patterns
  end
end
