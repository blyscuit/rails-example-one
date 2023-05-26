class Keyword < ApplicationRecord
    has_many :keyword_user
    has_many :users, through: :keyword_user
end
