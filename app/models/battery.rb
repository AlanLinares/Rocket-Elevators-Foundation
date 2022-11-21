class Battery < ApplicationRecord
    has_many :columns
    belongs_to :building
    belongs_to :employee

    # accepts_nested_attributes_for :column, :building, :employee
end
