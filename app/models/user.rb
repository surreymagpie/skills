class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :password, :email, presence: true
  validates :email, uniqueness: true
end
