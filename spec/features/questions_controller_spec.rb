require 'rails_helper'

describe "tests the question process" do
  it "adds a new question set", js: true do
    user = FactoryGirl.create(:user)
    profile = FactoryGirl.create(:profile, user: user)
    # question = FactoryGirl.create(:question, user: user)
    # answer1 = FactoryGirl.create(:answer, profile: profile, question: question)
    # answer2 = FactoryGirl.create(:answer, profile: profile, question: question)
    # question.answers = [answer1, answer2]

    login_as(user, :scope => :user, :run_callbacks => false)
    visit questions_path
    fill_in "content1", with: "test1"
    fill_in "content2", with: "test2"
    click_button "Save changes"
    expect(page).to have_content("test1")
    expect(page).to have_content("test2")
    Warden.test_reset!
  end

  it "no content provided for the question process", js: true do
    user = FactoryGirl.create(:user)
    profile = FactoryGirl.create(:profile, user: user)
    # question = FactoryGirl.create(:question, user: user)
    # answer1 = FactoryGirl.create(:answer, profile: profile, question: question)
    # answer2 = FactoryGirl.create(:answer, profile: profile, question: question)
    # question.answers = [answer1, answer2]

    login_as(user, :scope => :user, :run_callbacks => false)
    visit questions_path
    fill_in "content1", with: ""
    fill_in "content2", with: ""
    click_button "Save changes"
    expect(page).to have_content("")
    expect(page).to have_content("")
    Warden.test_reset!
  end
end
