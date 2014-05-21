Rails.application.routes.draw do

	root to: "home#index"



	# routes for users
	# get "/users" => "users#index"

	# get "/users/new" => "users#new"

	# post "/users" => "users#create"

	# post "/user/login" => "users#process_login"


	# routes for spots
	# get "/spots" => "spots#index"

	get "/spots/mod_flag" => "spots#mod_flag"



	get "log_out" => "sessions#destroy", :as => "log_out"
	get "log_in" => "sessions#new", :as => "log_in"
	get "sign_up" => "users#new", :as => "sign_up"
	resources :users
	resources :sessions
	resources :spots do
		resources :flags
		resources :comments
	end

end
	# NESTED ROUTES
	# resources :spots do
	# 	resources :flags
	# 	resources :comments
	# end 