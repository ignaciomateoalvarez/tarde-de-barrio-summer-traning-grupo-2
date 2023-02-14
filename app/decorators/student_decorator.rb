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
  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def age
    (Date.today - birth_date.to_date).to_i / 365
  end

  def attendance
    attends ? 'Sí' : 'No'
  end

  def grade
    school_grade.capitalize
  end
end
