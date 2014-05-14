FactoryGirl.define do
  factory :tasks_taskables_text_response, aliases: [:text_response], class: 'Tasks::Taskables::Text::Response' do
    text "MyString"
    request nil
  end
end
