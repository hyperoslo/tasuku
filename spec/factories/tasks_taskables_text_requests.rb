FactoryGirl.define do
  factory :tasks_taskables_text_request, aliases: [:text_request], class: 'Tasks::Taskables::Text::Request' do
    text "MyText"
  end
end
