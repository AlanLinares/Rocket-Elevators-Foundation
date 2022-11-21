class Address < ApplicationRecord
    has_one :building
    has_one :customer
    # geocoded_by :address
    # after_validation :geocode

    # accepts_nested_attributes_for :building, :customer
end
