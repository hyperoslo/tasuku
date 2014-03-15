require 'spec_helper'

describe 'tasks/taskables/verifications/confirmations/_form.html.erb' do
  let(:user)         { create :user }
  let(:verification) { create :verification }
  let(:confirmation) { build :verification_confirmation, verification: verification }

  it 'renders a form' do
    assign :confirmation, confirmation

    render partial: 'tasks/taskables/verifications/confirmations/form.html.erb', locals: {
      confirmation: confirmation,
      author: user
    }

    capybara = Capybara.string rendered

    author_type_field = capybara.find('input[name="taskables_verification_confirmation[author_type]"]')
    author_id_field   = capybara.find('input[name="taskables_verification_confirmation[author_id]"]')

    expect(author_type_field.value).to eq 'User'
    expect(author_id_field.value).to eq '1'
  end
end
