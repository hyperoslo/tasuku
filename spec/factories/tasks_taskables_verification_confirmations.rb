# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tasks_taskables_verification_confirmation, :class => 'Taskables::Verification::Confirmation' do
    verification nil
    author nil
  end
end
