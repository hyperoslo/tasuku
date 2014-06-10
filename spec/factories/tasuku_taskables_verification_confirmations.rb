# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasuku_taskables_verification_confirmation, aliases: [:verification_confirmation], class: 'Tasuku::Taskables::Verification::Confirmation' do
    verification nil
    author nil
  end
end
