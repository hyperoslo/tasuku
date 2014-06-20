# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_taskables_question, aliases: [:question], class: 'Tasuku::Taskables::Question' do
    text "MyText"
    multiple true

    factory :tasuku_taskables_question_with_options, aliases: [:question_with_options] do
      ignore do
        options_count 3
      end
      after :build do |question, evaluator|
        evaluator.options_count.times do |n|
          question.options.build text: "Option #{n}"
        end
      end
    end
  end
end
