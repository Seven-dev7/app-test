class Embassy < ApplicationRecord
    belongs_to :country
    has_many :foreigners, as: :foreignable
end
