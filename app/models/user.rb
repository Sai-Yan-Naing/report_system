class User < ApplicationRecord
	# for all input email to lower case
	 before_save { self.email = email.downcase }
	 has_many :reports, dependent: :destroy

	 # for email format
	VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	# presence for input field can't blank
	validates :name, presence: true, length: {minimum: 5}
	validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX },
	# for unique email
	uniqueness: { case_sensitive: false }

	# for secure password
	# attr_accessor :password
	has_secure_password
	 validates :password, presence: true, length: { minimum: 6 }

	def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	  end
end
