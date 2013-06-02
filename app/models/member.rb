class Member < ActiveRecord::Base
  attr_accessible :apt, :cell_phone, :city, :first_name, :home_phone, :last_name, :state, :street, :work_phone, :zip

  has_many :lendings

  def name
    last_name + ', ' + first_name
  end

  def address
    "#{street} #{apt}, #{city} #{state} #{zip}"
  end

  def phone_numbers
    output = []
    output << home_phone unless home_phone.blank?
    output << cell_phone unless cell_phone.blank?
    output << work_phone unless work_phone.blank?
    output.join(', ')
  end

end
