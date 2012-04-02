class Book < ActiveRecord::Base
  belongs_to :temple
  belongs_to :category
  attr_accessible :author, :date_received, :shelve_location, :title
end
