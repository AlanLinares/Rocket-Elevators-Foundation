ActiveAdmin.register Battery do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :employees_id, :buildings_id, :columns_id, :building_type, :status, :date_of_commission, :date_of_last_inspection, :certificate_of_operations, :information, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:employees_id, :buildings_id, :columns_id, :building_type, :status, :date_of_commission, :date_of_last_inspection, :certificate_of_operations, :information, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
