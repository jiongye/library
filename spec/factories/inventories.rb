# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inventory do
    book nil
    borrow_out 1
    temple_out 1
    course_out 1
    quantity 1
    in_stock 1
  end
end
