# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lending do
    book nil
    date_of_lend "2012-04-02"
    date_of_return "2012-04-02"
    due_date "2012-04-02"
    user nil
    course_period nil
  end
end
