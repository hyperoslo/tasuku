FactoryGirl.define do
  factory :tasuku_task, aliases: [:task], class: 'Tasuku::Task' do
    association :taskable, factory: :verification

    trait(:with_verification) { association :taskable, factory: :verification }
  end
end
