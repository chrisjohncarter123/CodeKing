class User < ApplicationRecord
  has_many :pushes
  has_many :repos, through: :pushes
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 

  def get_email_base
    return email.split("@").first

  end
  
end