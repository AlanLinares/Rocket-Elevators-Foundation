class Elevator < ApplicationRecord
include ActiveModel::Dirty
    belongs_to :column

    oldstatus = ""
    before_update do
        oldstatus = self.status_was
    end
    
    after_update do
        if oldstatus != self.status 
            notifier = Slack::Notifier.new ENV['slack_webhook']
            notifier.ping "The Elevators #{self.id} With serial number #{self.serial_numbers} changed status from #{oldstatus} to #{self.status}"

        end
    end
end
