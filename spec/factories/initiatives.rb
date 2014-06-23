# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :initiative do
    decree "Iniciativa con proyecto de decreto que reforma el artículo 39 de la Ley Orgánica del Congreso General de los Estados Unidos Mexicanos, para aumentar el número de comisiones ordinarias (en lo general y en lo particular)."
    date "2014-05-27"
    period "primer periodo ordinario"
    year "primer"
    legislature "LXII"

    factory :initiative_with_votes_and_deputies do
      after(:create) do |initiative|
        create_list(:vote, 10, initiative: initiative)
      end
    end

  end
end
