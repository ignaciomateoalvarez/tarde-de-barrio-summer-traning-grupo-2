class StudentsController < ApplicationController
  include Pundit

  def index
    authorize Student
    @presenter = StudentPresenter.new(params)
    @pagy, @students = @presenter.paginate
  end

  def show
    authorize Student
    @student = StudentPresenter.new(params).student
  end

  def new; end

  def create
    authorize Student
    @student = Student.new(student_params.merge(user: current_user))
    if @student.save
      redirect_to students_path, notice: t('.created')
    else
      redirect_to students_path, alert: t('.not_created')
    end
  end

  def edit
    @student = Student.find(params[:id])
    authorize @student
  end

  def update
    authorize Student
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice] = t('.updated')
    else
      render :edit
    end
  end

  def destroy; end

  private

  def student_params
    @student = params.require(:student)
          .permit(:first_name, :last_name, :birth_date,
                  :address, :school_grade, :attends)
  end
end
