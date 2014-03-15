# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_task, :class => 'Tasks::Task' do
    taskable nil
  end
end
