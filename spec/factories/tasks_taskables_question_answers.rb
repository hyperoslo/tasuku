# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_question_answer, :class => 'Taskables::Question::Answer' do
    option nil
    author nil
  end
end
