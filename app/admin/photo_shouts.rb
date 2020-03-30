ActiveAdmin.register PhotoShout do
  menu parent: "Shouts"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :image_file_name, :image_content_type, :image_file_size, :image_updated_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:image_file_name, :image_content_type, :image_file_size, :image_updated_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  show do
    attributes_table do
      render Shout.where(content_type: "PhotoShout", content_id: photo_shout.id)
    end
    active_admin_comments
  end

end
