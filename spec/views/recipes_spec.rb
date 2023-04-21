require 'rails_helper'

RSpec.describe 'Food', type: :system do
  describe 'GET /index' do
    before do
      visit user_session_path

      fill_in 'Email', with: 'foo@yopmail.com'
      fill_in 'Password', with: '1234567'

      click_button 'Log in'
      sleep 1

      click_link 'Recipes'
      sleep 1
      click_link 'Add Recipe'
      fill_in 'Name', with: 'Vegitable Rice'
      fill_in 'Preparation time', with: '20'
      fill_in 'Cooking time', with: '15'
      fill_in 'Description', with: 'Sweet Rice with milk very good for the health'
      click_button 'Add Recipe'
    end
    it 'should be in the recipes' do
      expect(page).to have_content 'Recipes'
    end
    it 'should check the recipe name' do
      sleep 1
      expect(page).to have_content 'Rice'
    end
    scenario 'user deletes a recipe by name' do
      visit recipes_path
      expect(page).to have_content 'Rice'
      within('div.recipes', text: 'Rice') do
        find('button', text: 'Delete Recipe').click
      end
      expect(page).not_to have_content 'Rice'
    end
    it 'should delete the recipes ' do
      within('div.recipes', text: 'Rice') do
        find('button', text: 'Delete Recipe').click
      end
      sleep 1
      expect(page).not_to have_text('Rice')
    end
    it 'Click on the recipes to get show page' do
      within('div.recipes', text: 'Rice') do
        find('a', text: 'Recipe').click
      end
      sleep 1
      expect(page).to have_content('Cooking time')
    end
    it 'Click on the recipes to get show page' do
      within('div.recipes', text: 'Rice') do
        find('a', text: 'Recipe').click
      end
      sleep 1
      click_button('Make Public')
      expect(page).to have_content('Recipe was successfully updated.')
    end
    it 'In the show page add Ingedient and also we can delete' do
      click_link 'Foods'

      click_button 'Add Food'
      fill_in 'Name', with: 'Rice'
      fill_in 'Measurement unit', with: 'kg'
      fill_in 'Price', with: '10'
      click_button 'Create Food'
      sleep 1

      click_link 'Recipes'
      within('div.recipes', text: 'Vegitable Rice') do
        find('a', text: 'Recipe').click
      end
      sleep 1
      click_button 'Add Ingredient'
      fill_in 'Quantity', with: '1'
      select 'Rice', from: 'recipe_food[food_id]'
      click_button 'Add Ingredient'
      sleep 1
      expect(page).to have_content('Rice')
      click_button 'Delete'
      sleep 1
      expect(page).to have_content 'Recipe food was successfully deleted.'
    end
  end
end
