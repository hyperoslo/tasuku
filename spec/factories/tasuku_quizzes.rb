# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_quiz, :class => 'Quiz' do
    text "MyText"
    description "MyText"
  end
end
