module UsersHelper

  def phone(contact)
    phones = []
    phones << "home: #{contact.home_phone}" unless contact.home_phone.blank?
    phones << "home: #{contact.cell_phone}" unless contact.cell_phone.blank?
    phones << "home: #{contact.work_phone}" unless contact.work_phone.blank?
    phones.join(", ")
  end

end
