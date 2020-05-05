class Ride < ApplicationRecord
    validates :user_id, presence: true, allow_nil: false
    validates :attraction_id, presence: true, allow_nil: false
    belongs_to :attraction
    belongs_to :user

    def take_ride


        #byebug

        if user.tickets < attraction.tickets && user.height < attraction.min_height
            "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
        elsif user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the Roller Coaster."
        elsif user.height < attraction.min_height
            "Sorry. You are not tall enough to ride the Roller Coaster."
        else
            user.tickets -= attraction.tickets
            user.nausea += attraction.nausea_rating
            user.happiness += attraction.happiness_rating
            user.save
        end

    end
end
