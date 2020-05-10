class Repo < ApplicationRecord
    has_many :pushes
    has_many :users, through: :pushes
    validates :name, presence: true, uniqueness: true
end
