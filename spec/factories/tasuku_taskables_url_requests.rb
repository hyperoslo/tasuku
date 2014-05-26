# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_taskables_url_request, aliases: [:url_request], class: 'Tasuku::Taskables::URL::Request' do
    text "MyText"
    description "MyText"
  end
end
