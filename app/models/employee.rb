class Employee < ApplicationRecord
    has_many :batteries 
    belongs_to :user

    # accepts_nested_attributes_for :battery, :users
end
