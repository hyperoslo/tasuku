# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_image_request, aliases: [:image_request], class: 'Tasks::Taskables::Image::Request' do
    text "MyText"
  end
end
