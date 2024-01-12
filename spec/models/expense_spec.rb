require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { create(:user) }
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:category_expenses) }
    it { should have_many(:categories).through(:category_expenses) }
  end

  describe 'factory' do
    it 'is valid' do
      expense = build(:expense, user:)
      expect(expense).to be_valid
    end

    it 'creates an expense with categories' do
      expense_with_categories = create(:expense, :with_categories, user:)

      expect(expense_with_categories).to be_valid
      expect(expense_with_categories.categories.count).to eq(3) # Update the count based on your factory definition
    end
  end
end
