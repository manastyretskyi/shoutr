ActiveAdmin.register User do

  form title: 'A custom title' do |f|
    input :email, as: :email
    input :username, as: :string
    input :password, as: :password, required: true
    input :role, :as => :select, :collection => [ :user, :moderator, :admin ]
    actions
  end

  index do
    column :id
    column :username
    column :email
    column :created_at
    column :updated_at
    column :followed_users_count
    column :followers_count
    column :role
    actions
  end

  permit_params do
    permitted = [:email, :username, :role]
    permitted << :password if params[:action] == 'create' && current_user.admin?
    permitted
  end

  controller do

    def find_resource
      @user = User.find_by(username: params[:id])
    end

  end
  
end
