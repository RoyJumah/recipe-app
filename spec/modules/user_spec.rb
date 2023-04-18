require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'John') }
  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'name is present' do
    expect(subject.name).to be_present
  end
  it 'name should be equal to John' do
    expect(subject.name).to eq('John')
  end
end
