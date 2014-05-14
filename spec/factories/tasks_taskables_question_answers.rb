# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_question_answer, aliases: [:question_answer], class: 'Tasks::Taskables::Question::Answer' do
    author nil

    ignore do
      options []
    end

    after :build do |answer, evaluator|
      evaluator.options.each do |option|
        answer.votes.build option: option
      end
    end
  end
end
