FactoryGirl.define do
  factory :tasks_task, aliases: [:task], class: 'Tasks::Task' do
    taskable nil

    trait :with_verification do
      after(:build) do |task|
        task.taskable = create :verification, task: nil
      end
    end
  end
end
