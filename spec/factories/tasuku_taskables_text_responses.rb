FactoryGirl.define do
  factory :tasuku_taskables_text_response, aliases: [:text_response], class: 'Tasuku::Taskables::Text::Response' do
    text "MyString"
    request nil
  end
end
