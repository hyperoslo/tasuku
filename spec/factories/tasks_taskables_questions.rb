# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_question, aliases: [:question], class: 'Tasks::Taskables::Question' do
    text "MyText"

    factory :tasks_taskables_question_with_options, aliases: [:question_with_options] do
      after(:create) { |question| create_list :question_option, 3, question: question }
    end
  end
end
