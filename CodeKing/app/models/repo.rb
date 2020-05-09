class Repo < ApplicationRecord
    has_many :pushes
    has_many :users, through: :pushes
end
