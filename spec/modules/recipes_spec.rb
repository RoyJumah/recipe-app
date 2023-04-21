require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @user = User.create(name: 'John')
    @recipe = Recipe.create(name: 'Chicken', preparation_time: 30, cooking_time: 20, description: 'Chicken is good',
                            public: true, user_id: @user.id)
  end
  it 'name is present' do
    expect(@recipe.name).to be_present
  end
  it 'name should be equal to Chicken' do
    expect(@recipe.name).to eq('Chicken')
  end
  it 'preparation_time is present' do
    expect(@recipe.preparation_time).to be_present
  end
  it 'preparation_time should be equal to 30' do
    expect(@recipe.preparation_time).to eq(30)
  end
  it 'Recipes is public' do
    expect(@recipe.public).to eq(true)
  end
end
