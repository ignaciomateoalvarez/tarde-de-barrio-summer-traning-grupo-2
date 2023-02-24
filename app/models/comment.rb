class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :user
  validates :comment, presence: true
end
