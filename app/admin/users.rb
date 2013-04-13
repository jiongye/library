ActiveAdmin.register User do
  index do
    column :id
    column :name
    column :username
    column :email
    column :role

    default_actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
    end

    f.actions
  end
end
