# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :role do
    name "librarian"

    factory :admin do
      name "admin"
    end
  end

end
