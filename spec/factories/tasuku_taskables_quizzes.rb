# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_taskables_quiz, aliases: [:quiz], :class => 'Tasuku::Taskables::Quiz' do
    text "Quiz text"
    description "Quiz description"

    factory :tasuku_taskables_quiz_with_questions, aliases: [:quiz_with_questions] do
      ignore do
        questions_count 3
        options_count 3
        correct_option 1
      end

      after :build do |quiz, evaluator|
        evaluator.questions_count.times do |n|
          question = quiz.questions.build( text: "Question #{n}" )
          evaluator.options_count.times do |n|
            question.options.build text: "Option #{n}", correct: (evaluator.correct_option == (n + 1))
          end
        end
      end
    end

  end
end
