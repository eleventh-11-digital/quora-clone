require 'bcrypt'

class User < ActiveRecord::Base
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :password, :confirmation => true #password_confirmation attr
	validates_length_of :password, :in => 6..20, :on => :create
	
	has_secure_password
	has_many :questions
	has_many :answers
	has_many :question_votes
	has_many :answer_votes
end