# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_verification, aliases: [:verification], class: 'Tasks::Taskables::Verification' do
    association :verifiable, factory: :tasks_taskables_question
  end
end
