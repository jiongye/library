require 'spec_helper'

describe Inventory do
  subject { FactoryGirl.create(:inventory, :quantity => 20) }

  describe "#in_stock" do
    it "should return 2" do
      subject.course_out = 8
      subject.temple_out = 7
      subject.borrow_out = 3
      subject.in_stock.should == 2
    end
  end

end