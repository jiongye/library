require 'spec_helper'

describe Lending do
  before do
    @book = FactoryGirl.create(:book)
    @inventory = FactoryGirl.create(:inventory, :book => @book, :quantity => 20)
  end

  describe "before_save :set_due_date" do
    before do
      @lending = FactoryGirl.create(:lending, :book => @book)
    end

    it "should set the due date before save when create a new record" do
      @lending.due_date.should == @lending.date_of_lend + 1.month
    end

    it "should set the due date for exist record" do
      @lending.date_of_lend = Date.today
      @lending.save
      @lending.due_date.should == Date.today + 1.month
    end
  end

  describe "after_create :increment_borrow_out and after_save: update_borrow_out_count" do
    before do
      @borrow_out = @inventory.borrow_out
      @lending = FactoryGirl.create(:lending, :book => @book)
    end

    it "should set the borrow_out to +1 when there is a new lending" do
      @inventory.reload.borrow_out.should == @borrow_out + 1
    end

    it "should set the borrow_out count to -1 when the lending returned and set the borrow_out to +1 when set returned to false" do
      @lending.returned = true
      @lending.date_of_return = Date.today
      @lending.save!
      @inventory.reload.borrow_out.should == @borrow_out
      @lending.returned = false
      @lending.save!
      @inventory.reload.borrow_out.should == @borrow_out + 1
    end

    it "should not change the borrow_out count when the returned status is not changed" do
      @lending.returned = true
      @lending.date_of_return = Date.today
      @lending.save!
      @lending.date_of_return = Date.today + 1.day
      @lending.save!
      @inventory.reload.borrow_out.should == @borrow_out
    end
  end

  describe "before_validation: check_inventory" do
    it "should not create a new lending if the inventory is <= 0" do
      @inventory.borrow_out = 20
      @inventory.save
      lending = FactoryGirl.build(:lending, :book => @book)
      lending.save.should be_false
    end
  end

end