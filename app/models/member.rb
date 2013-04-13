class Member < ActiveRecord::Base
  attr_accessible :apt, :cell_phone, :city, :first_name, :home_phone, :last_name, :state, :street, :work_phone, :zip

end
