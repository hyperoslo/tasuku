# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_url_request, :class => 'Taskables::URL::Request' do
    text "MyText"
    description "MyText"
  end
end
