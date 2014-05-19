class UsersController < ApplicationController

	def index

	end

	def new
		@user = User.new
	end


	def create
	  @user = User.new(user_attributes)
	  if @user.save
	    redirect_to root_url, :notice => "Signed up!"
	  else
	    render "new"
 		end
 	end

 	private

 	def user_attributes
 		params.require(:user).permit(:username, :email, :password, :password_confirmation, :age, :bio)
 	end	

end
	# def create

	# 	user_hash = params[:user]
	# 	if user_hash[:password] == user_hash[:password_confirm]
	# 		user = User.new
	# 		user.password = user_hash[:password]
	# 		user.username = user_hash[:username]
	# 		user.bio = user_hash[:bio]
	# 		user.email = user_hash[:email]
	# 		user.age = user_hash[:age]
	# 		user.save

	# 		if user.valid?
	# 		# log the user in when they register
	# 			@current_user = user
	# 			redirect_to "/users"
	# 		else
	# 		render text: "Username or Email is already taken!"
	# 		end
	# 	else
	# 	render text: "Passwords Did Not Match!"
	# 	end
		
	# end

	# def process_login
	# # process login form
	#     email = params[:email]
	#     password = params[:password]

	#     @current_user = User.authenticated?(email, password)

	#     if @current_user
	#       redirect_to spots_path
	#     else
	#       render text: "Login Failed! Invalid email or password!"
	#     end
	# end


