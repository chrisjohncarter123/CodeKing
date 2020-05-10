class Push < ApplicationRecord
    belongs_to :user
    belongs_to :repo
    validates :message, presence: true
    validates :content, presence: true
end
