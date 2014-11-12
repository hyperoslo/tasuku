# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :tasuku_taskables_poll_option, aliases: [:poll_option], class: 'Tasuku::Taskables::Poll::Option' do
    text Faker::Lorem.word
    reply Faker::Lorem.word
    poll nil
  end
end
