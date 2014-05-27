class User < ActiveRecord::Base
	# changed from include BCrypt 
	has_secure_password

	has_many :spots, through: :flags

	has_many :flags

	has_many :spots, through: :comments

	has_many :comments

	before_validation :downcase_email, :upcase_username

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	# validates_uniqueness_of :email
	validates :username, :email, uniqueness: true

	def downcase_email
	self.email = email.downcase
	end

	def upcase_username
		self.username = username.upcase
	end

end



	# before_validation :downcase_email, :downcase_username
	# validates :username, :email, uniqueness: true

	# def password= password_input
	# 	# passes the password_input through BCrypt::Password and hashes it
	# 	new_password_hash = Password.create(password_input)
	# 	# new password hash written to database
	# 	self.hashed_password = new_password_hash
	# 	self.hashed_password
	# end

	# # getter
	# def password
	# 	Password.new(self.hashed_password)
	# end

	# # check's a password
	# def check_password(password_input)
	# 	# does the password going in, match the DB pass?
	# 	password_input == self.password
	# end


	# def self.authenticated?(email_input, password_input)

	# 	user = User.find_by_email(email_input)
	# 	if user && user.password == password_input
	# 		puts "Authenticated!"
	# 		return user
	# 	else
	# 		puts "Did not authenticate!"
	# 		return nil
	# 	end
	# 	puts "Did not find email"
	# 	return nil
	# end


	


