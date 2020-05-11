class Repo < ApplicationRecord
    has_many :pushes
    has_many :users, through: :pushes
    validates :name, presence: true, uniqueness: true

    scope :starts_with_a, -> { where(name[0]=="a") }

    
end
