class User < ApplicationRecord
  before_save :downcase_email

  validates :name, presence: true, length: {maximum: Settings.user.name_max}

  validates :email, presence: true,
  length: {maximum: Settings.user.email_max},
  format: {with: Settings.user.email_regex},
  uniqueness: {case_sensitive: false}

  has_secure_password

  validates :password, presence: true,
  length: {minimum: Settings.user.password_min}

  private
  def downcase_email
    email.downcase!
  end
end
