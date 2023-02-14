class StudentDecorator <  Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def initialize (student)
    @student = student
  end

  def full_name
    "#{student.first_name.capitalize} #{@student.last_name.capitalize}"
  end

  def age
    real_age = (Date.today - @student.birth_date.to_date).years
  end

  def attendance 
    @student.attends ? 'Sí' : 'No' 
  end

  def school_grade
    @student.school_grade.capitalize
  end

end
