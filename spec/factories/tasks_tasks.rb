FactoryGirl.define do
  factory :tasks_task, aliases: [:task], class: 'Tasks::Task' do
    association :taskable, factory: :verification

    trait(:with_verification)     { association :taskable, factory: :verification }
    trait(:with_image_task)       { association :taskable, factory: :tasks_taskables_image_request }
    trait(:with_question_task)    { association :taskable, factory: :tasks_taskables_question_with_options }
    trait(:with_text_task)        {association :taskable, factory: :tasks_taskables_text_request}

    factory :image_task, traits: [:with_image_task]
    factory :question_task, traits: [:with_question_task]
    factory :text_task, traits: [:with_text_task]
  end
end
