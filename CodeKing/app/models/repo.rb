class Repo < ApplicationRecord
    has_many :pushes, dependent: :delete_all
    has_many :users, through: :pushes
    validates :name, presence: true, uniqueness: true

    scope :name_is_a, -> {where(name: "a")}
    def self.name_is_a
        where(name: "a")

    end

    scope :named, -> (name) {where("name LIKE ?", name)}
    def named(name)
        where("name LIKE ?", name)
    end

end
