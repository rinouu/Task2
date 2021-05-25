Rails.application.routes.draw do
  root to: 'posts#index'
  get 'sessions/new'
  	resources :posts do
	    collection do
	    	post :confirm
	    end
  	end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :update, :edit]
  resources :favorites, only: [:create, :destroy, :index]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
