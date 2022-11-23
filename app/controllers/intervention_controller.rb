class InterventionController < ApplicationController
  skip_before_action :verify_authenticity_token
    
  
    def create
      intervention = Intervention.create!(
          author: Employee.find(current_user.id),
          employee_id: params[:employee],
          elevator_id: params[:elevator],
          column_id: params[:column], 
          battery_id: params[:battery],
          building_id: params[:building],
          customer_id: params[:customer],
          id: params[:id],
          result: "Incomplete",
          report: params[:message],
          status: "Pending",

      
      )
      userEmail = ""
      companyName = ""
      employeeName = ""
      title = ""

      Customer.all.each do |c|
        if c.id == intervention.customer_id
          companyName = c.company_name
        end
      end
       
      Employee.all.each do |e|
        if e.id == intervention.employee_id
          employeeName = e.first_name + " " + e.last_name
        end
      end

      Employee.all.each do |e|
        if e.id == intervention.author_id
          userEmail = e.email
        end
      end

      Employee.all.each do |e|
        if e.id == intervention.author_id
          title = e.title
        end
      end
    # Your freshdesk domain
   freshdesk_domain = "https://topcompany-support.freshdesk.com/api/v2/tickets"

   # It could be either your user name or api_key.
   user_name_or_api_key = ENV['freshdesk_key']

   # If you have given api_key, then it should be x. If you have given user name, it should be password
   password_or_x = 'X'
   #attachments should be of the form array of Hash with files mapped to the key 'resource'.
   multipart_payload = { status: 2,
                         priority: 1,
                         type: 'Problem',
                         email: "#{userEmail}",
                         description: "This is an intervention by #{title}. #{companyName} has a problem in building #{intervention.building_id} with battery #{intervention.battery_id}
                         , column #{intervention.column_id}, and/or elevator #{intervention.elevator_id}. Please assign the problem to #{employeeName}. They provided a short description: #{intervention.report}.",
                         subject: 'Need Inspecting',
                         # attachments: [File.new('lead.attachment', 'rb')]
  }.to_json

  #  freshdesk_api_path = 'api/v2/tickets'

  #  freshdesk_api_url  = "https://#{freshdesk_domain}.freshdesk.com/#{freshdesk_api_path}"

   site = RestClient::Resource.new(freshdesk_domain, user_name_or_api_key)

   begin
   response = site.post(multipart_payload, :content_type => 'application/json')
   puts "response_code: #{response.code} \nLocation Header: #{response.headers[:Location]} \nresponse_body: #{response.body} \n"
   rescue RestClient::Exception => exception
   puts 'API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id'
   puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
   puts "Response Code: #{exception.response.code} \nResponse Body: #{exception.response.body} \n"

   end 
      redirect_to('/intervention')

  # ##############################################END OF FRESHDESK##############################################################################
      
end #############################end of create method



    def get_buildings_by_customer
        @buildings = Building.where("customer_id = ?", params[:customer_id])
        respond_to do |format|
          format.json { render :json => @buildings }
        end
      end 

      def get_batteries_by_building
        @batteries = Battery.where("building_id = ?", params[:building_id])
        respond_to do |format|
          format.json { render :json => @batteries }
        end
      end 

      def get_columns_by_battery
        @columns = Column.where("battery_id = ?", params[:battery_id])
        respond_to do |format|
          format.json { render :json => @columns }
        end
      end 

      def get_elevators_by_column
        @elevators = Elevator.where("column_id = ?", params[:column_id])
        respond_to do |format|
          format.json { render :json => @elevators }
        end
      end 

 

      def building_search
        if params[:customer].present? && params[:customer].strip != ""
          @buildings = Building.where("customer_id = ?", params[:customer])
        else
          @buildings = Building.all
        end
      end
end
