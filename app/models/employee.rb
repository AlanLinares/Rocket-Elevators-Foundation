class Employee < ApplicationRecord
    has_many :batteries 
    belongs_to :user

    has_many :interventions

    # accepts_nested_attributes_for :battery, :users
end
