Rails.application.routes.draw do
  get 'sessions/new'
  	resources :posts do
	    collection do
	    	post :confirm
	    end
  	end
end
