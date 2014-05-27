Rails.application.routes.draw do

	root to: "home#index"



	# routes for users
	# get "/users" => "users#index"

	# get "/users/new" => "users#new"

	# post "/users" => "users#create"

	# post "/user/login" => "users#process_login"


	# routes for spots
	# get "/spots" => "spots#index"


	get "log_out" => "sessions#destroy", :as => "log_out"
	get "log_in" => "sessions#new", :as => "log_in"
	get "sign_up" => "users#new", :as => "sign_up"
	resources :sessions




	resources :users, only: [:new, :create]
	resources :spots, only: [:index, :show] do
		resources :flags, only: [:new, :create]
		resources :comments
	end

end

