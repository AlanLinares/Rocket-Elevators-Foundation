ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :customer_creation_date, :company_name, :company_address, :contact_full_name, :company_contact_phone, :company_contact_email, :company_description, :service_tech_full_name, :service_tech_phone, :tech_manager_email, :user_id, :address_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_creation_date, :company_name, :company_address, :contact_full_name, :company_contact_phone, :company_contact_email, :company_description, :service_tech_full_name, :service_tech_phone, :tech_manager_email, :user_id, :address_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
