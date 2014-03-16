# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_question, aliases: [:question], class: 'Tasks::Taskables::Question' do
    text "MyText"
  end
end
