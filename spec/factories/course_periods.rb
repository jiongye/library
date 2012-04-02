# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course_period do
    start_date "2012-04-02"
    course nil
  end
end
