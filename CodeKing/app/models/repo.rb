class Repo < ApplicationRecord
    has_many :pushes
    has_many :users, through: :pushes
    validates :name, presence: true, uniqueness: true

    scope :name_is_a, -> {where(name: "a")}

    def self.name_is_a
        where(name: "a")

    end
    
end
