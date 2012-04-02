class Lending < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  belongs_to :course_period
  attr_accessible :date_of_lend, :date_of_return, :due_date
end
