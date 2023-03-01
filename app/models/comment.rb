class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :user
  has_many :answers
  validates :comment, presence: true
end
