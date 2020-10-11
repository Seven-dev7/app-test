class Country < ApplicationRecord
    has_many :embassies
    has_many :foreigners
end
