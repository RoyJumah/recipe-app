require 'rails_helper'

RSpec.describe 'Food', type: :system do
  # describe 'SIGN IN' do
  #     it 'signs me in' do
  #         fill_in email_field, with: 'foo@yopmail.com'
  #         fill_in password_field, with: '1234567'
  #         click_button 'Log in'

  #         expect(page).to have_content 'Signed in successfully.'
  #     end
  # end
  describe 'GET /index' do
    before do
      visit user_session_path

      fill_in 'Email', with: 'foo@yopmail.com'
      fill_in 'Password', with: '1234567'

      click_button 'Log in'
      sleep 1

      click_link 'Add Food'
      fill_in 'Name', with: 'Rice'
      fill_in 'Measurement unit', with: 'kg'
      fill_in 'Price', with: '10'
      click_button 'Create Food'
      sleep 1
      click_link 'Add Food'
      fill_in 'Name', with: 'Wheat'
      fill_in 'Measurement unit', with: 'kg'
      fill_in 'Price', with: '10'
      click_button 'Create Food'
    end
    it 'should check the food list name' do
      expect(page).to have_content 'Rice'
      expect(page).to have_content 'Wheat'
    end
    it 'should check the food list Measurement unit' do
      expect(page).to have_content 'kg'
      expect(page).to have_content 'kg'
    end
    it 'should check the food list Measurement unit' do
      expect(page).to have_content 10
      expect(page).to have_content 10
    end
    it 'should check the delete the food' do
      within('table') do
        within('tr', text: 'Rice') do
          find('button', text: 'Delete').click
        end
      end
      sleep 1
      expect(page).not_to have_content('Rice')
    end
  end
end
