require 'rails_helper'

RSpec.describe CategoryExpense, type: :model do
  describe 'associations' do
    it { should belong_to(:expense) }
    it { should belong_to(:category) }
  end

  describe 'validations' do
    it { should validate_presence_of(:expense_id) }
    it { should validate_presence_of(:category_id) }
  end
end
