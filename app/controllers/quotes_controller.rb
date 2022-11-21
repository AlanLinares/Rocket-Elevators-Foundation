class QuotesController < ApplicationController

  # before_action :set_quote, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

#   # GET /quotes or /quotes.json
#   def index
#     @quotes = Quote.all
#   end

#   # GET /quotes/1 or /quotes/1.json
#   def show
#   end

#   # GET /quotes/new
#   def new
#     @quote = Quote.new
#   end

#   # GET /quotes/1/edit
#   def edit
#   end

#   # POST /quotes or /quotes.json
#   def create
#     @quote = Quote.new(quote_params)

#     respond_to do |format|
#       if @quote.save
#         format.html { redirect_to quote_url(@quote), notice: "Quote was successfully created." }
#         format.json { render :show, status: :created, location: @quote }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @quote.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /quotes/1 or /quotes/1.json
#   def update
#     respond_to do |format|
#       if @quote.update(quote_params)
#         format.html { redirect_to quote_url(@quote), notice: "Quote was successfully updated." }
#         format.json { render :show, status: :ok, location: @quote }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @quote.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /quotes/1 or /quotes/1.json
#   def destroy
#     @quote.destroy

#     respond_to do |format|
#       format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_quote
#       @quote = Quote.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def quote_params
#       params.fetch(:quote, {})
#     end
# end

def create
  quote = Quote.create!(

    building_type: params[:building_type],
    number_of_apartments: params[:number_of_apartments], 
    number_of_floors: params[:number_of_floors],
    number_of_basements: params[:number_of_basements],
    number_of_companies: params[:number_of_companies],
    number_of_parking_spots: params[:number_of_parking_spots],
    number_of_elevators: params[:number_of_elevators],
    number_of_corporations: params[:number_of_corporations],  
    max_occupancy: params[:max_occupancy],
    business_hours: params[:business_hours],
    quality: params[:quality],
    elevator_amount: params[:elevator_amount],
    elevator_unit_price: params[:elevator_unit_price],
    elevator_total_price: params[:elevator_total_price],
    installation_fees: params[:installation_fees],
    final_price: params[:final_price],
    full_name: params[:full_name],
    email: params[:email],
    phone_number: params[:phone_number]
  )

   # Your freshdesk domain
   freshdesk_domain = "https://topcompany-support.freshdesk.com/api/v2/tickets"

   # It could be either your user name or api_key.
   user_name_or_api_key = ENV['freshdesk_key']

   # If you have given api_key, then it should be x. If you have given user name, it should be password
   password_or_x = 'X'
   #attachments should be of the form array of Hash with files mapped to the key 'resource'.
   multipart_payload = { status: 2,
                         priority: 1,
                         type: 'Feature Request',
                         email: 'alan.linares@gmail.com',
                         description: "#{quote.full_name}" + ' would like to add some elevators to their buiding. They can be reached at ' + "#{quote.email}" + ' and '+ "#{quote.phone_number}" +
                         '. They are needing '+ "#{quote.elevator_amount}" + ' elevators for a total price of ' + "#{quote.final_price}",
                         subject: 'New Feature',
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
redirect_to('/index')
end


end