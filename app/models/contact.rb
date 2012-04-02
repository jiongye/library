class Contact < ActiveRecord::Base
  belongs_to :user
  attr_accessible :apt, :cellphone, :city, :firstname, :homephone, :lastname, :state, :street, :workphone, :zip
end
