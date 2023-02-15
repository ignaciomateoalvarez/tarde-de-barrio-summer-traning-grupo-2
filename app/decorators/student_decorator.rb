class StudentDecorator <  Draper::Decorator
  delegate_all
  include Draper::LazyHelpers
  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def age
    (Date.today - birth_date.to_date).to_i / 365
  end

  def attendance
    attends ? t('.yes_') : t('.no_')
  end

  def grade
    school_grade.capitalize
  end
end
