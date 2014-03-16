# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_question_answer, aliases: [:question_answer], class: 'Tasks::Taskables::Question::Answer' do
    option nil
    author nil
  end
end
