class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  # require 'sendgrid-ruby'
  # include SendGrid

  
    # default :from => 'any_from_address@example.com'
  
    # send a signup email to the user, pass in the user object that   contains the user's email address
    # def send_contact_email(lead)
    #   @lead = lead
    #   from = SendGrid::Email.new(email: 'test@example.com')
    #   to = SendGrid::Email.new(email: 'alan.linares@gmail.com')
    #   subject = 'Sending with Twilio SendGrid is Fun'
    #   content = SendGrid::Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    #   mail = SendGrid::Mail.new(from, subject, to, content)

    #   sg = SendGrid::API.new(api_key: ENV['sendgrid_key'])
    #   response = sg.client.mail._('send').post(request_body: mail.to_json)
    #   puts response.status_code
    #   puts response.body
    #   puts response.parsed_body
    #   puts response.headers
    # end
  
  





end
