class Book < ActiveRecord::Base
  belongs_to :temple
  belongs_to :category
  has_one :inventory, :dependent => :destroy
  attr_accessible :author, :date_received, :shelve_location, :title, :temple_id, :category_id, :inventory_attributes

  validates_presence_of :title, :temple, :category

  accepts_nested_attributes_for :inventory

  default_scope order('id desc')
end
