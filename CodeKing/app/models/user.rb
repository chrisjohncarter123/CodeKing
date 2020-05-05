class User < ApplicationRecord
    validates :name, presence: true, allow_nil: false
    validates :password, presence: true, allow_nil: false
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if nausea > happiness
            "sad"
        else
            "happy"
        end
    end


end
