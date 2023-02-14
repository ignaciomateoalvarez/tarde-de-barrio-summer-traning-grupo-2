class StudentPresenter
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def students
    @students ||= Student.all
  end
end
