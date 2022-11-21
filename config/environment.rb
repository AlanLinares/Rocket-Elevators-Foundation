# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.smtp_settings = {
#   :user_name => ENV["sendgrid_username"], # This is the string literal 'apikey', NOT the ID of your API key
#   :password => ENV["sendgrid_password"], # This is the secret sendgrid API key which was issued during API key creation
#   :domain => 'sendgrid.net',
#   :address => 'smtp.sendgrid.net',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }
