require 'spec_helper'
# As a site visitor
# I want to contact the site's staff
# So that I can tell them how awesome they are

feature "User creates an inquiry" do

  it 'creates a valid inquiry' do
    visit '/inquiries/new'
    fill_in "First name", with: "Mister"
    fill_in "Last name", with: "Winslow"
    fill_in "Email", with: "email@email.com"
    fill_in "Subject", with: "Nice Subject!"
    fill_in "Description", with: "Words that describe"
    click_on "Create Inquiry"
    expect(page).to have_content("Words that describe")
  end

  it 'requires all fields' do
    visit '/inquiries/new'
    click_on 'Create Inquiry'
    expect(page).to have_content("can't be blank")
  end

end