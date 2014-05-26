# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_taskables_verification, aliases: [:verification], class: 'Tasuku::Taskables::Verification' do
    association :verifiable, factory: :tasuku_taskables_question
  end
end
