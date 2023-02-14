class StudentDecorator <  Draper::Decorator

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def self.collection_decorator_class
    PaginatingDecorator
  end

  def full_name
    "#{student.first_name.capitalize} #{student.last_name.capitalize}"
  end

  def age
    (Date.today - student.birth_date.to_date).to_i / 365
  end

  def attendance
    student.attends ? 'Sí' : 'No'
  end

  def school_grade
    student.school_grade.capitalize
  end
end
