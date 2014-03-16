require 'spec_helper'

describe 'tasks/taskables/verifications/confirmations/_form.html.erb' do
  let(:user)         { create :user }
  let(:verification) { create :verification }
  let(:confirmation) { build :verification_confirmation, verification: verification }
  let(:html)         { Capybara.string rendered }

  before do
    assign :confirmation, confirmation

    render partial: 'tasks/taskables/verifications/confirmations/form.html.erb', locals: {
      confirmation: confirmation,
      author: user
    }
  end

  it 'renders fields with values' do
    expect(html.find('input[name="taskables_verification_confirmation[author_type]"]').value).to eq 'User'
    expect(html.find('input[name="taskables_verification_confirmation[author_id]"]').value).to eq '1'
  end
end
