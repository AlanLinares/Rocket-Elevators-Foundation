# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'test@test.com', password: 'password', password_confirmation: 'password') 
require 'csv'
require 'faker'

csvfile = File.read(Rails.root.join('lib', 'seeds', 'Employee_List.csv'))
table = CSV.parse(csvfile, headers: true)
table.each do |row|
    user = User.create!(
        email: row['email'],
        password: 'password',
    )
 
    Employee.create!(
        
        last_name: row['last_name'], 
        title: row['title'], 
        first_name: row['first_name'],
        email: row['email'],
        user: user 
    )

    AdminUser.create!(
        email: row['email'],
        password: 'password',
    )
end
    puts "//*******************Employee Table seeded*******************"

100.times do 
    Lead.create!(
        full_name: Faker::Name.name, 
        company_name: Faker::Company.name, 
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone,
        project_name: Faker::DcComics.hero,
        project_description: Faker::Hipster.sentence, 
        department_of_elevators: ["sales", "support", "admin"].sample, 
        message: Faker::Hipster.sentence, 
        attachment: "change to binary soon", 
        date_of_contact_request: Faker::Time.between(3.years.ago, Date.today)
        
    )
    end
puts "//***************Leads Table seeded with #{Lead.count} records*****************"

jsonfile = File.read(Rails.root.join('lib', 'seeds', 'addresses.json'))
data_hash = JSON.parse(jsonfile)
randomarray = Array.new(data_hash['addresses'].count - 1) {|e| e += 1};
arandom = randomarray.shuffle;
address_counter = 0;

(data_hash['addresses'].count-1).times do
    thisaddress = data_hash['addresses'][arandom[address_counter]]
    Address.create!(
        type_of_address: ["Home", "Business", "Shipping", "Billing"].sample, 
        status: ["verified", "unverified",].sample, 
        entity: ["Business", "Personal"].sample, 
        number_and_street: thisaddress["address1"], 
        suite_or_apartment: thisaddress["address2"], 
        city: thisaddress["city"], 
        postal_code: thisaddress["postalCode"], 
        country: "USA", 
        notes: Faker::Hipster.sentence,
        lat: thisaddress["coordinates"]["lat"],
        lng: thisaddress["coordinates"]["lng"],
       

    ) 
    address_counter += 1
end
puts "//***************Address Table seeded with #{Address.count} records*****************"

record = Address.first.id 
counter = 0

20.times do
    user = User.create(
        email: Faker::Internet.email,
        password: 'password',
    )

    Customer.create!(
        user: user, 
        customer_creation_date: Faker::Date.between(3.years.ago, Date.today),
        company_name: (Faker::Company.name + Faker::Company.suffix),
        address_id: record + counter,
        company_address: Faker::Address.full_address,
        contact_full_name: Faker::Name.unique.name,
        company_contact_phone: Faker::PhoneNumber.cell_phone,
        company_contact_email: Faker::Internet.email,
        # company_description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
        service_tech_full_name: Faker::Name.unique.name,
        service_tech_phone: Faker::PhoneNumber.cell_phone,
        tech_manager_email: Faker::Internet.email
    )
    counter += 1
end
puts "//***************Customer Table seeded with #{Customer.count} records*****************"


Customer.all.each do |cust|

    rand(1..2).times do
        Building.create!(
            customer: cust,
            address_id: record + counter,
            admin_full_name: Faker::Name.unique.name,
            admin_email: Faker::Internet.email,
            admin_phone: Faker::PhoneNumber.cell_phone,
            tech_contact_full_name: Faker::Name.unique.name,
            tech_contact_email: Faker::Internet.email,
            tech_contact_phone: Faker::PhoneNumber.cell_phone,
        )
        counter += 1
        end

end
puts "//***************Building Table seeded with #{Building.count} records*****************"

Building.all.each do |b|

    BuildingDetail.create!(
        building: b,
        infokey: ["floors", "max_occupants", "Construction_year"].sample,
        value: [rand(), Faker::Date.between(2.years.ago, Date.today)].sample
        
    )  

end
puts "//***************Building_Details Table seeded with #{BuildingDetail.count} records*****************"

Building.all.each do |b|
    
    rand(1..2).times do
        Battery.create!(
            building: b,
            employee_id: Faker::Number.between(Employee.first.id, (Employee.first.id+Employee.count-1)), 
            building_type: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
            status: ["Running","Running","Running","Running","Running","Running","Running","Running","Intervention","Stopped"].sample,
            date_of_commission: Faker::Date.between(3.years.ago, Date.today),
            date_of_last_inspection: Faker::Date.between(2.years.ago, Date.today),
            # certificate_of_operations:

        )
    end

end

puts "//***************Battery Table seeded with #{Battery.count} records***************"

Battery.all.each do |bat|
    if bat.building_type == "Residential"
        floors = rand(1..10)
    else 
        floors = rand(10..30)
    end

    rand(1..2).times do
        Column.create!(
            battery: bat, 
            building_type: bat.building_type,
            number_of_floors_served: floors, 
            status: ["Running","Running","Running","Running","Running","Running","Running","Running","Intervention","Stopped"].sample,
            information: Faker::Quote.famous_last_words, 
            notes: Faker::Quote.famous_last_words

        )
    end

end
puts "//***************Column Table seeded with #{Column.count} records*****************"
Column.all.each do |col|
    rand(1..5).times do
        Elevator.create!(
            column: col,
            serial_numbers: rand(),
            model: ["Kone", "thyssenkrupp", "Hitachi", "Otis Woldwide", "Schindler Group"].sample,
            building_type: col.building_type,
            status: ["Running","Running","Running","Running","Running","Running","Running","Running","Intervention","Stopped"].sample,
            date_of_commissioning: Faker::Date.between(3.years.ago, Date.today), 
            date_of_last_inspection: Faker::Date.between(2.years.ago, Date.today), 
            # certificate_of_inspection:
            information: Faker::Quote.famous_last_words,
            notes: Faker::Quote.famous_last_words

        )
    end

end
puts "//***************Elevator Table seeded with #{Elevator.count} records*****************"


100.times do
    Quote.create!(
    
      building_type: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
      number_of_apartments: Faker::Number.between( 1,  15),
      number_of_floors: Faker::Number.between( 1,  20),
      number_of_basements: Faker::Number.between( 1,  5),
      number_of_companies: Faker::Number.between( 1,  10),
      number_of_parking_spots: Faker::Number.between( 10,  100),
      number_of_elevators: Faker::Number.between( 2,  20),
      number_of_corporations: Faker::Number.between( 1,  10),
      max_occupancy: Faker::Number.between( 6,  12),
      business_hours: Faker::Number.between( 10,  24),
      quality:["Standard", "Premium", "Excelium"].sample,
      elevator_amount: Faker::Number.between( 2,  20),
      elevator_unit_price: Faker::Number.between( 7000,  15000),
      elevator_total_price: Faker::Number.between( 20000,  40000),
      installation_fees: Faker::Number.between( 15000,  30000),
      final_price: Faker::Number.between( 40000,  80000),
    )
end
puts "//***************Quote Table seeded with #{Quote.count} records*****************"

