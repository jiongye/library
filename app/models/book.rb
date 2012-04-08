class Book < ActiveRecord::Base
  belongs_to :temple
  belongs_to :category
  attr_accessible :author, :date_received, :shelve_location, :title, :temple_id, :category_id

  validates_presence_of :title
end
