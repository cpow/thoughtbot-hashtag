Hashtag::Application.routes.draw do
  root to: 'searches#new'
  resources :searches, ony: [:create, :new, :show]
end
