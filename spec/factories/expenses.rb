FactoryBot.define do
  factory :expense do
    association :user
    name { 'MYexpenese' }
    amount { 100 }

    transient do
      categories_count { 3 }
    end

    trait :with_categories do
      after(:create) do |expense, evaluator|
        categories = create_list(:category, evaluator.categories_count, user: expense.user)
        expense.categories << categories
      end
    end
  end
end
