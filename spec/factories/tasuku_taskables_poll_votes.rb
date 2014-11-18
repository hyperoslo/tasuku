# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_taskables_poll_vote, aliases: [:poll_vote], :class => 'Tasuku::Taskables::Poll::Vote' do
    answer nil
    option nil
  end
end
