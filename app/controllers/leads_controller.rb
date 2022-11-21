
class LeadsController < ApplicationController
    require 'rest_client'
    require 'freshdesk'
    require 'sendgrid-ruby'
    include SendGrid
    require 'json'
  
    skip_before_action :verify_authenticity_token

    def create
        lead = Lead.create!(

            full_name: params[:full_name],
            company_name: params[:company_name],
            email: params[:email],
            phone: params[:phone_number],
            project_name: params[:project_name],
            project_description: params[:project_description],
            department_of_elevators: params[:department_of_elevators],
            message: params[:message],
            attachment: params[:attachment],
            date_of_contact_request: DateTime.now,
    
        )
#  **************************************************sendgrid code*********************************
        from = Email.new(email: 'alan.linares@gmail.com')
        to = Email.new(email: lead.email)
        subject = 'Sending with SendGrid is Fun'
        content = Content.new(type: 'text/plain', value: 'Greetings '+"#{lead.full_name}"+'
        We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project '+"#{lead.project_name}"+'.
        A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.
        We’ll Talk soon
        The Rocket Team
        ')
        mail = Mail.new(from, subject, to, content)
    
        sg = SendGrid::API.new(api_key: ENV['sendgrid_key'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers


        
        #   redirect_back fallback_location: root_path, notice: "Your Request was successfully created and sent!"
# ********************************************sendgrid code end**************************************

        

        if lead.full_name == nil 
            lead.full_name = "n/a"
        end
        if lead.company_name == nil 
            lead.company_name = "n/a"
        end
        if lead.phone == nil 
            lead.phone = "n/a"
        end
        if lead.email == nil 
            lead.email = "alan.linares@gmail.com"
        end
        if lead.project_name == nil 
            lead.project_name = "n/a"
        end
        if lead.project_description == nil 
            lead.project_description = "n/a"
        end
        if lead.department_of_elevators == nil 
            lead.department_of_elevators = "n/a"
        end
        if lead.message == nil 
            lead.message = "n/a"
        end
        if lead.attachment == nil 
            lead.attachment = "no attachment"
        else
            lead.attachment = "has attachment"
        end

        # Your freshdesk domain
        freshdesk_domain = "https://topcompany-support.freshdesk.com/api/v2/tickets"

        # It could be either your user name or api_key.
        user_name_or_api_key = ENV["freshdesk_key"]

        # If you have given api_key, then it should be x. If you have given user name, it should be password
        password_or_x = "X"

        #attachments should be of the form array of Hash with files mapped to the key 'resource'.
        multipart_payload = { status: 2,
                            priority: 1,
                            type: "Question",
                            email: "alan.linares@gmail.com",
                            description: "#{lead.full_name}" + " is needing help with their project. They can be reached at " + "#{lead.email}" + " and " + "#{lead.phone}" +
                            ". Their project description reads: "+"#{lead.project_description}",
                            subject: "New Lead",
                            # attachments: [File.new('lead.attachment', 'rb')]
        }.to_json
       

        # freshdesk_api_path = 'api/v2/tickets'

        # freshdesk_api_url  = "https://#{freshdesk_domain}.freshdesk.com/#{freshdesk_api_path}"

        site = RestClient::Resource.new(freshdesk_domain, user_name_or_api_key)

        begin
        response = site.post(multipart_payload, :content_type => 'application/json')
        puts "response_code: #{response.code} \nLocation Header: #{response.headers[:Location]} \nresponse_body: #{response.body} \n"
        rescue RestClient::Exception => exception
        puts 'API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id'
        puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
        puts "Response Code: #{exception.response.code} \nResponse Body: #{exception.response.body} \n"

        end 
            redirect_to('/index')

    end 

            # redirect_back fallback_location: '/root', notice: "Your Request was successfully created" #and sent!"

#   redirect_to('/index')




end