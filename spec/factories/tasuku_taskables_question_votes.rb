# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_taskables_question_vote, aliases: [:question_vote], :class => 'Taskables::Question::Vote' do
    answer nil
    option nil
  end
end
