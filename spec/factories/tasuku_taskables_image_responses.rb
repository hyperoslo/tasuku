# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_taskables_image_response, aliases: [:image_response], class: 'Tasuku::Taskables::Image::Response' do
    image "MyString"
    request nil
  end
end
