class Intervention < ApplicationRecord
    belongs_to :author, class_name: 'Employee', optional: true

end
