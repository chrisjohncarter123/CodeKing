class Repo < ApplicationRecord
    has_many :pushes, dependent: :delete_all
    has_many :users, through: :pushes
    validates :name, presence: true, uniqueness: true


    scope :named, -> (name) {where("name LIKE ?", name)}
    def named(name)
        where("name LIKE ?", name)
    end

end
