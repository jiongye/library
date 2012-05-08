class Inventory < ActiveRecord::Base
  belongs_to :book
  attr_accessible :borrow_out, :course_out, :quantity, :temple_out, :book_id

  validates_presence_of :quantity

  def in_stock
    quantity - course_out.to_i - temple_out.to_i - borrow_out.to_i
  end

end
