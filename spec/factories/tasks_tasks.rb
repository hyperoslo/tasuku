# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_task, aliases: [:task], class: 'Tasks::Task' do
    taskable nil

    factory :verification_task do
      after(:create) { |task| create :verification, task: task }
    end
  end
end
