class Answer < ApplicationRecord
  belongs_to :user

  belongs_to :publication

  validates :body, presence: true
end
