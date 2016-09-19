class Question < ApplicationRecord
  has_many :questions_answers
  has_many :answers, through: :questions_answers
  belongs_to :profile
end
