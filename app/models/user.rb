require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, Serial
	property :name, String
	property :user_name, String, :unique => true
	property :email, String, :unique => true
	property :password_digest, Text

	def password=(password)
		@password = password
	    self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(email, password)
    	user = first(:email => email)
    	if user && BCrypt::Password.new(user.password_digest) == password
    		user
    	else
    		nil
    	end
    end

	validates_confirmation_of :password
    validates_uniqueness_of :email
    validates_uniqueness_of :user_name

end