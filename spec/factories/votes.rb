# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    deputy_id 1
    initiative_id 1
    type ""
  end
end
