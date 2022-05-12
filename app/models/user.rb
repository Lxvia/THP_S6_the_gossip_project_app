class User < ApplicationRecord
    has_many :gossips #through :comment
    belongs_to :city
    has_many :comments
end
