class Answer < ApplicationRecord
  has_many :questions_answers
  has_many :votes
  has_many :questions, through: :questions_answers
  validates :content, presence: true
end
