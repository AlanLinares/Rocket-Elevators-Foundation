class Customer < ApplicationRecord
    belongs_to :user
    has_many :buildings 
    belongs_to :address 

    
    # accepts_nested_attributes_for :users
end
