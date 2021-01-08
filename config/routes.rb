Rails.application.routes.draw do
  get 'new', to: 'games#new', as: :new
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'score', to: 'games#score', as: :score
end
