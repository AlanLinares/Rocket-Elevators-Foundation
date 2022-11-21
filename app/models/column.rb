class Column < ApplicationRecord
    belongs_to :battery
    has_many :elevators

    # accepts_nested_attributes_for :battery, :elevators
end