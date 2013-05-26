require 'spec_helper'

describe Inventory do
  subject { FactoryGirl.create(:inventory, :shelve_quantity => 20) }

  describe "#on_shelve" do
    it "should return 2" do
      subject.borrow_out = 3
      subject.on_shelve.should == 17
    end
  end

end