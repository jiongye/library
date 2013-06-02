ActiveAdmin.register Member do

  index do
    column :id
    column :name
    column :address
    column :phone_numbers

    default_actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :last_name
      f.input :first_name
      f.input :street
      f.input :apt
      f.input :city
      f.input :state
      f.input :zip
      f.input :home_phone
      f.input :cell_phone
      f.input :work_phone
    end

    f.actions
  end

end
