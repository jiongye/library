# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    user_id nil
    firstname "MyString"
    lastname "MyString"
    street "MyString"
    apt "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    homephone "MyString"
    cellphone "MyString"
    workphone "MyString"
  end
end
