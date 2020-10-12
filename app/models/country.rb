class Country < ApplicationRecord
    has_many :embassies
    has_many :foreigners, as: :foreignable
end
