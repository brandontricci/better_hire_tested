require "spec_helper"

feature :position do

#   before (:each) do
#     @user = create :user
#     sign_in @user
#   end
  before do
    login
  end
  
  scenario "A user creates a position successfully" do
    visit "/positions"
    click_on "Add a job position"
    fill_in "Name", with: "Web Designer"
    fill_in "Description", with: "Someone with a little sense of design!"
    click_on "Create"
    expect(page).to have_text("Web Designer template")
  end

  scenario "A user receives an error while trying to create a invalid position" do
    visit "/positions"
    click_on "Add a job position"
    fill_in "Name", with: ""
    fill_in "Description", with: "Someone with a little sense of design!"
    click_on "Create"
    expect(page).to have_text("There was an error when creating your job position!")
  end

  scenario "A user goes to the show page and sees the position name" do
    position = create :position
    visit "/positions/1"
    expect(page).to have_text("Web Designer")
  end

  scenario "A user can view a position page" do
    position = create :position
    visit "/positions"
    click_on "details"
    expect(page).to have_text("#{position.name}")
  end

  scenario "A user can edit a position name" do
    position = create :position
    visit "/positions/#{position.id}"
    click_on "Edit"
    fill_in "Name", with: "UX Designer"
    click_on "Update"
    expect(page).to have_text("UX Designer")
  end

  # scenario "A user can delete a position", js: true do 
  #   position = create :position
  #   visit "/positions/#{position.id}"
  #   click_on "Edit"
  #   click_on "Delete"
  #   page.driver.browser.switch_to.alert.accept
  #   expect(page).to have_text("Your job position has been deleted.")
  # end
  
end
