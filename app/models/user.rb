class User < ActiveRecord::Base
  has_secure_password
  has_many :skills

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password,  confirmation: true, length: { minimum: 6 }, if: :password_required?

  def full_name
    first_name + " " + last_name
  end

  private

  def password_required?
    new_record? || !password.nil?
  end
end
