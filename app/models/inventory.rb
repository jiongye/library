class Inventory < ActiveRecord::Base
  belongs_to :book
  attr_accessible :borrow_out, :course_out, :in_stock, :quantity, :temple_out
end
