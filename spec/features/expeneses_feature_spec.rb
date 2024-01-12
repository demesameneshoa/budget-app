require 'rails_helper'

RSpec.feature 'Expenses', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User creates a new expense' do
    category = create(:category, user:, name: 'Category Name') # Create a category
    visit new_category_expense_path(category_id: category.id)
    fill_in 'Name', with: 'New Expense'
    fill_in 'Amount', with: '100'
    select 'Category Name', from: 'expense_category_ids'
    click_button 'Add Transaction'
    expect(page).to have_text('New Expense')
  end

  scenario 'User sees expens
  es index for a category' do
    create_list(:expense, 3, :with_categories, user:)
    visit category_expenses_path(category_id: user.categories.first.id)
    expect(page).to have_text('MyCategory Total:')
    expect(page).to have_text('MYexpenese')
  end
end
