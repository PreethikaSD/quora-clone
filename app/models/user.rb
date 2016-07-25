class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_secure_password
	validates :email, presence: true, length: { minimum: 7 }, uniqueness: true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :name, presence: true, length: {maximum: 8}, uniqueness: true

	def self.authenticate(password)
		if self.authenticate(params[:user][:password])
			return self
		else
			return nil
		end
	end
end
