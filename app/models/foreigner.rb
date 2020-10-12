class Foreigner < ApplicationRecord
    belongs_to :foreignable, polymorphic: true
end
