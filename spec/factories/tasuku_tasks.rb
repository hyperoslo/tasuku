FactoryGirl.define do
  factory :tasuku_task, aliases: [:task], class: 'Tasuku::Task' do
    association :taskable, factory: :verification

    trait(:with_verification)     { association :taskable, factory: :verification }
    trait(:with_image_task)       { association :taskable, factory: :image_request }
    trait(:with_question_task)    { association :taskable, factory: :tasuku_taskables_question_with_options }
    trait(:with_poll_task)        { association :taskable, factory: :tasuku_taskables_poll_with_options }
    trait(:with_text_task)        { association :taskable, factory: :text_request }

    factory :image_task, traits: [:with_image_task]
    factory :question_task, traits: [:with_question_task]
    factory :poll_task, traits: [:with_poll_task]
    factory :text_task, traits: [:with_text_task]
  end
end
