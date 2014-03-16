# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :tasks_taskables_question_option, aliases: [:question_option], class: 'Tasks::Taskables::Question::Option' do
    text Faker::Lorem.word
    question nil
  end
end
