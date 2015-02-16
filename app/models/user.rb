class User < ActiveRecord::Base
  has_secure_password
  has_many :skills
  accepts_nested_attributes_for :skills, reject_if: proc { |attributes| attributes['description'].blank? }, allow_destroy: true

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password,  confirmation: true, length: { minimum: 6 }, if: :password_required?

  before_save :email_downcase

  def full_name
    first_name + " " + last_name
  end

  private

  def password_required?
    new_record? || !password.nil?
  end

  def email_downcase
    self.email.downcase
  end
end
