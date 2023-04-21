require 'rails_helper'

RSpec.feature 'UserSignsIn', type: :system do
  let(:user) { create(:user) }

  it 'with valid credentials' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
  end
end
