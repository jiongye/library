class Contact < ActiveRecord::Base
  belongs_to :user
  attr_accessible :apt, :cell_phone, :city, :first_name, :home_phone, :last_name, :state, :street, :work_phone, :zip

end
