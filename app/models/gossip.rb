class Gossip < ApplicationRecord
    validates :title, presence: true, length: {in: 3..14}
    validates :content, presence: true
    belongs_to :user
    has_and_belongs_to_many :tags
end
