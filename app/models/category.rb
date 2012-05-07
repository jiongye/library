class Category < ActiveRecord::Base
  has_many :books
  attr_accessible :name

  validates_presence_of :name

  def to_s
    name
  end
end
