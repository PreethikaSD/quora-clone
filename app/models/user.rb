class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_secure_password
	validates :email, presence: true, length: { minimum: 7 }, uniqueness: true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :name, presence: true, length: {maximum: 8}, uniqueness: true

	def self.authenticate(email, password)
		valid_user = self.find_by(email: email)
		if valid_user != nil and valid_user.authenticate(password)
			valid_user
		else 
			valid_user = nil
		end
	end
end
