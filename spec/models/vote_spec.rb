require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should belong_to :answer }
  it { should belong_to :profile }
end
