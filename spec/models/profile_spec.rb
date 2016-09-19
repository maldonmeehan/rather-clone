require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should have_many :questions }
  it { should belong_to :user }
  it { validate_presence_of :name }
end
