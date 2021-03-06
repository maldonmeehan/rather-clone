class Profile < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :votes
  validates :name, presence: true
  has_attached_file :avatar, :styles => { medium: "300x300", thumb: "100x100" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
