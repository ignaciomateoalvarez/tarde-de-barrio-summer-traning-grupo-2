class StudentsController < ApplicationController
  include Pundit

  def index
    @presenter = StudentPresenter.new(params)
    @pagy, @students = @presenter.paginate
  end

  def show
    @student = StudentPresenter.new(params).student
  end

  def new; end

  def create
    @student = Student.new(student_params.merge(user: current_user))
    if @student.save
      redirect_to students_path, notice: t('.created')
    else
      redirect_to students_path, alert: t('.not_created')
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def student_params
    @student = params.require(:student)
          .permit(:first_name, :last_name, :birth_date,
                  :address, :school_grade, :attends)
  end
end
