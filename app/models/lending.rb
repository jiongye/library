class Lending < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  belongs_to :course_period
  attr_accessible :date_of_lend, :date_of_return, :book_id, :user_id, :course_period_id

  validates_presence_of :book, :date_of_lend, :user

  before_save :set_due_date

  private

  def set_due_date
    self.due_date = date_of_lend + 1.month
  end

  # call this method whenever the returned value change
  def update_borrow_out

  end

end
