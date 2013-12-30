require 'spec_helper'

feature "User deletes an inquiry" do
  
  it 'deletes an inquiry' do
    Inquiry.create!(first_name: "Mister", last_name: "Winslow", email: "blah@blah.com", subject: "Blahhh", description: "This & That")
    visit '/inquiries'
    expect(Inquiry.all.count).to eql(1)
    click_on "X"
    expect(Inquiry.all.count).to eql(0)
  end

end