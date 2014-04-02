# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_image_response, aliases: [:image_response], class: 'Tasks::Taskables::Image::Response' do
    image "MyString"
    request nil
  end
end
