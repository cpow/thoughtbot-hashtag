require 'spec_helper'

feature 'Guest visits homepage' do
  scenario 'learns about the application and what it does' do
    visit root_path
    expect(page).to have_css '[data-role="title"]', text: 'Hashtag'
    expect(page).to have_css '[data-role="description"]'
  end
end
