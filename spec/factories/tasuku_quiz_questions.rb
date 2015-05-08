# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_quiz_question, :class => 'QuizQuestions' do
    quiz nil
    question nil
  end
end
