class StudentPresenter
  include Pagy::Backend
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def student
    @student = Student.find(params[:id]).decorate
  end

  def students
    paginate unless @pagy.present?
    @students.decorate
  end

  def pagynate 
    paginate unless @pagy.present?
    @pagy
  end

  def paginate
    @pagy, @students = pagy(Student.all.order(created_at: :desc))
  end
end
