class Inventory < ActiveRecord::Base
  belongs_to :book
  attr_accessible :borrow_out, :quantity, :book_id, :shelve_quantity

  validates_presence_of :quantity

  def in_stock
    quantity - borrow_out.to_i
  end

  def on_shelve
    shelve_quantity - borrow_out.to_i
  end

end
