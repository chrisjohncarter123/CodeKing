class User < ApplicationRecord
  has_many :pushes
  has_many :repos, through: :pushes
  has_secure_password
  validates :email, presence: true, uniqueness: true
end