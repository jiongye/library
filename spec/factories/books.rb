# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "MyString"
    temple nil
    category nil
    author "MyString"
    date_received "2012-04-02"
    shelve_location "MyString"
  end
end
