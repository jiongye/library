require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user) }

  it "should create a new instance given a valid attribute" do
    user
  end

  it "should not require an email address" do
    user.email = nil
    user.should be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      user.email = address
      user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      user.email = address
      user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    user_with_duplicate_email = FactoryGirl.build(:user, :email => user.email)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = user.email.upcase
    user_with_duplicate_email = FactoryGirl.build(:user, :email => upcased_email)
    user_with_duplicate_email.should_not be_valid
  end

  describe "passwords" do

    it "should have a password attribute" do
      user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should not require a password" do
      user.password = user.password_confirmation = ''
      user.should be_valid
    end

    it "should require a matching password confirmation" do
      user.password = 'test'
      user.password_confirmation = 'not test'
      user.should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      user.password = user.password_confirmation = short
      user.should_not be_valid
    end

  end

  describe "password encryption" do

    it "should have an encrypted password attribute" do
      user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      user.encrypted_password.should_not be_blank
    end

  end

  describe "before_save :generate_library_id, on => :create" do

    it "should return 00001 for the first user" do
      user.library_id.should == '00001'
    end

    it "should not change library_id on update" do
      library_id = user.library_id
      FactoryGirl.create(:user)
      FactoryGirl.create(:user)
      user.name = 'test'
      user.save
      user.reload.library_id.should == library_id
    end

    it "should equal to the count of users" do
      FactoryGirl.create(:user)
      FactoryGirl.create(:user)
      user = FactoryGirl.create(:user)
      user.library_id.should == '00003'
    end
  end

end