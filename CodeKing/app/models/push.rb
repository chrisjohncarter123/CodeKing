class Push < ApplicationRecord
    belongs_to :user
    belongs_to :repo
end
