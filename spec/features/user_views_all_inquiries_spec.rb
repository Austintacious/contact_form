require 'spec_helper'
# As an admin
# I want to review contact inquiries
# So that I can respond or take action

feature "User views all inquiries" do
  
  it 'sees a title' do
    visit '/inquiries'
    expect(page).to have_content("Contact Inquiries")
  end

  it 'sees all the inquiries listed on the page' do
    inquiry1 = Inquiry.create!(first_name: "Mister", last_name: "Winslow", email: "blah@blah.com", subject: "Blahhh", description: "This & That")
    inquiry2 = Inquiry.create!(first_name: "Mister", last_name: "Winslow", email: "blah@blah.com", subject: "Blerg", description: "blahblahblah")
    visit '/inquiries'
    expect(page).to have_content(inquiry1.subject)
    expect(page).to have_content(inquiry2.subject)
  end

end
