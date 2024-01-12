require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:icon) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:category_expenses).dependent(:destroy) }
    it { should have_many(:expenses).through(:category_expenses) }
  end

  describe 'factory' do
    it 'is valid' do
      category = build(:category, user:)
      expect(category).to be_valid
    end
  end
end
