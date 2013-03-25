class Inventory < ActiveRecord::Base
  belongs_to :book
  attr_accessible :borrow_out, :course_out, :quantity, :temple_out, :book_id, :shelve_quantity

  validates_presence_of :quantity, :book_id

  def in_stock
    quantity - course_out.to_i - temple_out.to_i - borrow_out.to_i
  end

  def on_shelve
    shelve_quantity - borrow_out.to_i
  end

end
