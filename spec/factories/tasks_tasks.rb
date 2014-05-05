FactoryGirl.define do
  factory :tasks_task, aliases: [:task], class: 'Tasks::Task' do
    association :taskable, factory: :verification

    trait(:with_verification) { association :taskable, factory: :verification }
  end
end
