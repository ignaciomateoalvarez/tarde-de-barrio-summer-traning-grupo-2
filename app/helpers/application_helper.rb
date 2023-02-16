# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def get_alert_class(type)
    case type
    when 'notice'
      'success'
    when 'alert'
      'failure'
    else
      ''
    end
  end

  def translate_enum(student, school_grade) 
    student.school_grade(school_grade)
  end

end
