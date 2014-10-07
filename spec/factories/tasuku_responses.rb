FactoryGirl.define do
  factory :tasuku_response, aliases: [:response], class: 'Tasuku::Taskables::Taskable::Response' do
    association :author, factory: :user
    association :task,   factory: :task
  end
end
