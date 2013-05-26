class Lending < ActiveRecord::Base
  belongs_to :book
  belongs_to :member
  attr_accessible :date_of_lend, :date_of_return, :book_id, :member_id

  validates_presence_of :book, :date_of_lend, :member
  validates_presence_of :date_of_return, :if => :returned?

  validate :check_inventory
  before_save :set_due_date
  after_create :increment_borrow_out
  before_update :get_returned_status
  after_update :update_borrow_out_count

  scope :active, where(:returned => false)
  scope :already_returned, where(:returned => true)

  private

  def set_due_date
    self.due_date = date_of_lend + 1.month
  end

  def get_returned_status
    @returned_status_changed = returned_changed? ? true : false
    true
  end

  def update_borrow_out_count
    if @returned_status_changed
      inventory = book.inventory
      if returned?
        inventory.borrow_out -= 1
      else
        inventory.borrow_out += 1
      end
      inventory.save!
    end

    true
  end

  def increment_borrow_out
    inventory = book.inventory
    inventory.borrow_out += 1
    inventory.save!
  end

  def check_inventory
    if book.inventory.on_shelve <= 0
      errors.add :book, "There is no quantity on shelve for the book"
    end
  end

end
