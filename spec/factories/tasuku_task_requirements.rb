# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_task_requirement, aliases: [:task_requirement], class: 'Tasuku::TaskRequirement' do
    association :task,        factory: :task
    association :requirement, factory: :task
  end
end
