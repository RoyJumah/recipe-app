require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @user = User.create(name: 'John')
    @food = Food.create(name: 'Chicken', measurement_unit: 'kg', price: 30, quantity: 10, user_id: @user.id)
  end
  it 'is valid with valid attributes' do
    expect(@food).to be_valid
  end
  it 'name is present' do
    expect(@food.name).to be_present
  end
  it 'name should be equal to Chicken' do
    expect(@food.name).to eq('Chicken')
  end
  it 'measurement_unit is present' do
    expect(@food.measurement_unit).to be_present
  end
  it 'measurement_unit should be equal to kg' do
    expect(@food.measurement_unit).to eq('kg')
  end
  it 'price is present' do
    expect(@food.price).to be_present
  end
  it 'price should be equal to 30' do
    expect(@food.price).to eq(30)
  end
end
