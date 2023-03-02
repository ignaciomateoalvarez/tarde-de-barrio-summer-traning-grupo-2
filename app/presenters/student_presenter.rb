class StudentPresenter
  include Pagy::Backend
  attr_reader :params, :highlighted, :not_highlighted

  def initialize(params)
    @params = params
  end

  def student
    @student = Student.find(params[:id]).decorate
    setup_comments!
    @student
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

  def setup_comments!
    @highlighted = @student.comments.where(highlight: true).decorate
    @not_highlighted = @student.comments.where(highlight: false)
                                        .order(created_at: :desc)
                                        .decorate
                                        .group_by{ |c| c.created_at.to_date }
  end
end
