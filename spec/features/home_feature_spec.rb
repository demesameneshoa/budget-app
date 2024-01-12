# spec/features/home_feature_spec.rb
require 'rails_helper'

RSpec.feature 'Home', type: :feature do
  scenario 'User visits the splash screen' do
    visit root_path
    expect(page).to have_content('Budget Me')
    expect(page).to have_content('LOG IN')
    expect(page).to have_content('SIGN UP')
  end
end
