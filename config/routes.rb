Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  authenticate :user, -> (user) {user.employee} do
  ActiveAdmin.routes(self)
  mount Blazer::Engine, at: "blazer"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/intervention", to:"pages#intervention"
end
devise_for :users

post '/quote', to: 'quotes#create'

# TODO post for leads; DONE
post '/leads', to: 'leads#create'

post '/intervention', to: 'intervention#create'

root to: "pages#index"

get "/index", to: "pages#index"

get "/commercial", to:"pages#commercial"

get "/quoteform", to:"pages#quoteform"

get "/residential", to:"pages#residential"



get 'get_buildings_by_customer/:customer_id', to: 'intervention#get_buildings_by_customer'

get 'get_batteries_by_building/:building_id', to: 'intervention#get_batteries_by_building'

get 'get_columns_by_battery/:battery_id', to: 'intervention#get_columns_by_battery'

get 'get_elevators_by_column/:column_id', to: 'intervention#get_elevators_by_column'



# TODO check if there should be route for twilio
end
