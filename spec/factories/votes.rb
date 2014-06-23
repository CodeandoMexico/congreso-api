# Read about factories at https://github.com/thoughtbot/factory_girl
TYPES=["favor","ausente","abstencion","quorum","en contra"]
FactoryGirl.define do
  factory :vote do
    deputy
    vote_type TYPES.sample
    initiative
  end
end
