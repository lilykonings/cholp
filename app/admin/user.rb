ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :role
    actions # 'default_actions' is no longer provided
  end

  filter :email

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :radio, collection: {Administrator: 'administrator', User: 'user'}
    end
    f.actions
  end
end
