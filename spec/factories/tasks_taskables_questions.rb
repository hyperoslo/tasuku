# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_question, aliases: [:question], class: 'Tasks::Taskables::Question' do
    text "MyText"
    multiple true

    factory :tasks_taskables_question_with_options, aliases: [:question_with_options] do
      after :build do |question, evaluator|
        3.times { |n| question.options.build text: "Option #{n}" }
      end
    end
  end
end
