require 'spec_helper'

feature "user" do

  before do
    login
  end

  scenario "when logged in user visits the homepage" do
    visit "/"
    expect(page).to have_content("Dashboard")
  end
end