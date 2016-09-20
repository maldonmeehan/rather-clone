require 'rails_helper'

describe "tests the vote process" do
  it "will add a vote to the first item" do
    user = FactoryGirl.create(:user)
    profile = FactoryGirl.create(:profile, user: user)
    question = FactoryGirl.create(:question, profile: profile)
    answer1 = FactoryGirl.create(:answer)
    answer2 = FactoryGirl.create(:answer)
    question.answers = [answer1, answer2]
    question.save

    vote = FactoryGirl.create(:vote, profile: profile, answer: answer1)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit questions_path

    click_button "vote-id-#{answer1.id}"
  end

  it "will add a vote to the second item" do

  end
end
