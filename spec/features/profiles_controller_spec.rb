require 'rails_helper'

describe "tests the profile process" do
  it "will add a profile to a user" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit new_profile_path
    fill_in "Name", :with => "Test Name"
    fill_in "Country", :with => "Test Country"
    fill_in "Gender", :with => "Test Gender"
    click_button "Create Profile"
    click_on "Test Name"
    expect(page).to have_content "Test Country"
  end

  it "will give an error when no content is provided by the user" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit new_profile_path
    fill_in "Name", :with => ""
    fill_in "Country", :with => ""
    fill_in "Gender", :with => ""
    click_button "Create Profile"
    expect(page).to have_content "Your profile was not saved!"
  end


  it "will return an error when the wrong user tries to access another profile" do
    user = FactoryGirl.create(:user)
    profile = FactoryGirl.create(:profile, user: user)
    login_as(user, :scope => :user, :run_callbacks => false)

    user2 = FactoryGirl.create(:user, email: "bad_guy@bad-guy-place.com")
    profile2 = FactoryGirl.create(:profile, user: user2)

    visit profile_path(profile2.id)
    expect(page).to have_content "You lie John Snow"

  end
end
