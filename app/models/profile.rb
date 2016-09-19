class Profile < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :votes
  validates :name, presence: true
end
