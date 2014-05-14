# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_url_response, :class => 'Taskables::URL::Response' do
    url "MyText"
    request nil
    author nil
  end
end
