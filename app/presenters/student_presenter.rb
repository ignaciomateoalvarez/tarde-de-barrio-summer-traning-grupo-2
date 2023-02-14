class StudentPresenter
  include Pagy::Backend
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def students
    @students ||= StudentDecorator.decorate_collection(Student.all)
  end

  def paginate
    @pagy, @record = pagy(students)
  end
end
