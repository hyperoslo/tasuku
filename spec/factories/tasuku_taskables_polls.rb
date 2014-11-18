# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_taskables_poll, aliases: [:poll], class: 'Tasuku::Taskables::Poll' do
    text "MyText"
    multiple true

    factory :tasuku_taskables_poll_with_options, aliases: [:poll_with_options] do
      ignore do
        options_count 3
      end
      after :build do |poll, evaluator|
        evaluator.options_count.times do |n|
          poll.options.build text: "Option #{n}"
        end
      end
    end
  end
end
