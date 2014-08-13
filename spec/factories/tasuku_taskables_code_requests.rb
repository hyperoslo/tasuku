# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_taskables_code_request, aliases: [:code_request], class: 'Tasuku::Taskables::Code::Request' do
    text "Enter the code"
    code "1337"
  end
end
