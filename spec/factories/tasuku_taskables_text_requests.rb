FactoryGirl.define do
  factory :tasuku_taskables_text_request, aliases: [:text_request], class: 'Tasuku::Taskables::Text::Request' do
    text "MyText"
  end
end
