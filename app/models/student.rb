require 'date'

class Student < ApplicationRecord
  validates :first_name, :last_name, length: { minimum: 3 }, presence: true,
                                     format: { with: /\A[a-zA-Z\ñÑ\u00C0-\u017F\']+[\s?[a-zA-Z\ñÑ\u00C0-\u017F\']*]*\z/ }
  validates :birth_date, presence: true, format: { with: /^\d{4}-\d{2}-\d{2}$/, multiline: true }
  validates :attends, inclusion: { in: [ true, false ] }
  validates :address, presence: true
  validates :school_grade, presence: true

  enum school_grade: %i[inicial primaria secundaria]

  def age
    (Date.today - birth_date.to_date).years
  end
end
