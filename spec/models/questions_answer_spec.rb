require 'rails_helper'

RSpec.describe QuestionsAnswer, type: :model do
  it { should belong_to :question }
  it { should belong_to :answer }
end
