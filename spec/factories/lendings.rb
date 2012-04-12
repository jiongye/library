FactoryGirl.define do

  factory :lending do
    book
    user

    date_of_lend Date.today - 5.days
  end

end