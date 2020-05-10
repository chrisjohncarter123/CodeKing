class User < ApplicationRecord
  has_many :pushes
  has_many :repos, through: :pushes
  has_secure_password
  validates :email, presence: true, uniqueness: true

  scope :has_a_repo, -> { where(repo.length > 0) }
  #scope :published, -> { where(published: true) }

  def get_email_base
    return email.split("@").first

  end
  
end