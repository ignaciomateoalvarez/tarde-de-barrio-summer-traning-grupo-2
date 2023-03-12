class Asist < ApplicationRecord
  belongs_to :student

  scope :count_asists_type, ->(value) { where('created_at >= ?', Time.zone.now.beginning_of_day).where(asist: value).count }

  enum asist: %i[absent present retired]
end
