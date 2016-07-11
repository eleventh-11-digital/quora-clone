require 'bcrypt'

class User < ActiveRecord::Base
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

	has_secure_password
end