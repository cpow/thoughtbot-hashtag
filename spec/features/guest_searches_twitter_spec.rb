require 'spec_helper'

feature 'Guest searches twitter' do
  scenario 'finds results of the hashtag' do
    search_for "#rails"

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: /#rails/i, count: 15
  end

  scenario 'displays known information' do
    Searcher.backend = FakeTwitter

    FakeTwitter['#rails'] = 5.times.map do
      {text: 'I love #rails'}
    end

    search_for "#rails"

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: 'I love #rails', count: 5
  end

  scenario 'finds results of the hashtag' do
    search_for "rails"

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: /#rails/i, count: 15
  end

  scenario 'finds results of the hashtag' do
    search_for "rails"

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: /#rails/i, count: 15
  end

  def search_for(term)
    visit root_path
    fill_in 'Hashtag', with: term
    click_on 'Search'
  end
end
