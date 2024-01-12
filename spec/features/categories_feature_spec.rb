require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User sees categories index' do
    create_list(:category, 3, user: user)
    visit categories_path
    expect(page).to have_text('MyCategory')
  end

  scenario 'User visits new category page' do
    visit new_category_path
    expect(page).to have_text('New category')
  end

  scenario 'User creates a new category' do
    visit new_category_path
    fill_in 'Name', with: 'New category'
    fill_in 'Icon URL', with: 'https://cdn.pixabay.com/photo/2013/07/13/01/22/vegetables-155616_640.png'

    click_button 'Add Category'
    expect(page).to have_text('New Category')
  end
end