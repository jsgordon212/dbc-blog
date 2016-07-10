class User < ActiveRecord::Base
	has_secure_password
	has_many :posts, dependent: :destroy

	validates :email, presence: true
	validates :email, uniqueness: true

end
