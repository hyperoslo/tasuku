# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_taskables_poll_answer, aliases: [:poll_answer], class: 'Tasuku::Taskables::Poll::Answer' do
    author { User.create }

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
