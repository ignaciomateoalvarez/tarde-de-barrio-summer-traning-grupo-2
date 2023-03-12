require 'date'

class Student < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :asist

  validates :first_name, :last_name, length: { minimum: 3 }, presence: true,
                                     format: { with: /\A[a-zA-Z\ñÑ\u00C0-\u017F\']+[\s?[a-zA-Z\ñÑ\u00C0-\u017F\']*]*\z/ }
  validates :birth_date, presence: true, format: { with: /^\d{4}-\d{2}-\d{2}$/, multiline: true }
  validates :attends, inclusion: { in: [true, false] }
  validates :address, presence: true
  validates :school_grade, presence: true

  validate :cant_be_future

  enum school_grade: %i[inicial primaria secundaria]

  def age
    (Date.today - birth_date.to_date).years
  end

  def cant_be_future
    unless (birth_date.present? && !birth_date.future?)
      errors.add(:birth_date, I18n.t('models.student.error_date'))
    else
      true
    end
  end
end
