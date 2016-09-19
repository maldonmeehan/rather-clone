require 'rails_helper'

RSpec.describe Answer, type: :model do
 it { should validate_presence_of :content }
 it { should have_many :questions }
 it { should have_many :votes }
end
