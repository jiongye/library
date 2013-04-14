require 'spec_helper'

describe Inventory do
  subject { FactoryGirl.create(:inventory, :quantity => 20) }

  describe "#in_stock" do
    it "should return 2" do
      subject.borrow_out = 3
      subject.in_stock.should == 17
    end
  end

end