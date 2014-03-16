# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_question_option, aliases: [:question_option], class: 'Tasks::Taskables::Question::Option' do
    text "MyText"
    question nil
  end
end
