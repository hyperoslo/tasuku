# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_question, :class => 'Taskables::Question' do
    text "MyText"
  end
end
