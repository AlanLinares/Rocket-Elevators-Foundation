# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_17_032041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dim_customers", force: :cascade do |t|
    t.string "creation_date"
    t.string "company_name"
    t.string "full_name_of_company_contact"
    t.string "email_of_company_contact"
    t.string "nb_elevators"
    t.string "customer_city"
  end

  create_table "fact_contacts", force: :cascade do |t|
    t.string "contact_id"
    t.string "company"
    t.string "email"
    t.string "project_name"
    t.datetime "creation_date"
  end

  create_table "fact_elevators", force: :cascade do |t|
    t.string "serial_number"
    t.string "building_id"
    t.string "customer_id"
    t.string "building_city"
    t.datetime "date_of_commissioning"
  end

  create_table "fact_interventions", force: :cascade do |t|
    t.string "employee_id"
    t.string "building_id"
    t.string "battery_id"
    t.string "column_id"
    t.string "elevator_id"
    t.string "result"
    t.string "report"
    t.string "status"
    t.datetime "start_date_of_intervention"
    t.datetime "end_date_of_intervention"
  end

  create_table "fact_quotes", force: :cascade do |t|
    t.string "quote_id"
    t.string "email"
    t.string "nbElevator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "creation"
  end

  create_table "test", force: :cascade do |t|
    t.datetime "creation_date"
    t.string "company_name"
    t.string "full_name_of_company_contact"
    t.string "email_of_company_contact"
    t.string "nb_elevators"
    t.string "customer_city"
  end

end
