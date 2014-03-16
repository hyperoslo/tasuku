# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_question_option, :class => 'Taskables::Question::Option' do
    text "MyText"
    question nil
  end
end
