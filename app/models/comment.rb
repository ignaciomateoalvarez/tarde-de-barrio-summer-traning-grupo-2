class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :user
  has_many :answers
  has_many :likes
  validates :comment, presence: true
end
