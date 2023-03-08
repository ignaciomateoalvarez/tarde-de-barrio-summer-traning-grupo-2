class Publication < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :likes
  validates :comment, presence: true

  mount_uploaders :files, CommentFileUploader
end
