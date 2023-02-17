class StudentsController < ApplicationController
  include Pundit
  before_action :set_user, only: [:edit, :update]

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
      redirect_to students_path, success: t('.created')
    else
      redirect_to students_path, warning: t('.not_created')
    end
  end

  def edit
    authorize @student
  end

  def update
    authorize @student
    if @student.update(student_params.merge(user: current_user))
      redirect_to students_path, notice: t('.updated')
    else
      render :edit
    end
  end

  def destroy; end

  private

  def set_user
    @student = Student.find(params[:id])
  end

  def student_params
<<<<<<< HEAD
    params.require(:student)
          .except(:favourite_subjects, :subject_difficulty)
=======
    @student = params.require(:student)
>>>>>>> 0beec08 (Asociaciones User y Students)
          .permit(:first_name, :last_name, :birth_date,
                  :address, :school_grade, :attends)
  end
end
