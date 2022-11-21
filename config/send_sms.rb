# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = ENV['Twilio']
auth_token = '6a6988b6f9a90f2992a5212691e97e1e'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+18304026118' # Your Twilio number
to = '+17274926464' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hello! How can we help you today? Please describe what problems you're currently experiencing"
)
