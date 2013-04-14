FactoryGirl.define do

  factory :lending do
    book
    member

    date_of_lend Date.today - 5.days
  end

end