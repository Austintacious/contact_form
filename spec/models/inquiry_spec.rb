require 'spec_helper'

describe Inquiry do
  let(:blanks) {['', ' ', nil]}
  let(:invalid_emails) {['blah.com', '@blah.com', '@@.com', 'blah@.com', 'blah', '@@blah.com', 'com', '.com']}

  it {should have_valid(:first_name).when('Austin')}
  it {should_not have_valid(:first_name).when(*blanks)}

  it {should have_valid(:last_name).when('Winslow')}
  it {should_not have_valid(:last_name).when(*blanks)}

  it {should have_valid(:email).when('blah@blah.com')}
  it {should_not have_valid(:email).when(*blanks, *invalid_emails)}

  it {should have_valid(:subject).when('Subject')}
  it {should_not have_valid(:subject).when(*blanks)}

  it {should have_valid(:description).when('That that and the other')}
  it {should_not have_valid(:description).when(*blanks)}

  it 'should be unique' do
    inquiry1 = FactoryGirl.build(:inquiry)
    inquiry2 = FactoryGirl.build(:inquiry)
    expect(inquiry1.save).to be_true
    expect(inquiry2.save).to be_false
  end
end