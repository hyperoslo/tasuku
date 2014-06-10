# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :tasuku_taskables_question_option, aliases: [:question_option], class: 'Tasuku::Taskables::Question::Option' do
    text Faker::Lorem.word
    question nil
  end
end
