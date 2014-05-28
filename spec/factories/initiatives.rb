# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :initiative do
    decree "MyString"
    date "2014-05-27"
    period "MyString"
    year "MyString"
    legislature "MyString"

    factory :initiative_with_votes do
      after(:create) do |initiative|
        create_list(:vote, 10, initiative: initiative)
      end
    end

  end
end
