FactoryGirl.define do
  factory :tasks_task, aliases: [:task], class: 'Tasks::Task' do
    association :taskable, factory: :verification

    trait(:with_verification) { association :taskable, factory: :verification }

    factory :image_task do
      association :taskable, factory: :tasks_taskables_image_request
    end

    factory :question_task do
      association :taskable, factory: :tasks_taskables_question_with_options
    end

    factory :text_task do
      association :taskable, factory: :tasks_taskables_text_request
    end
  end
end
