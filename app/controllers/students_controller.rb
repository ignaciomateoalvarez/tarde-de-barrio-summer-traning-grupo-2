class StudentsController < ApplicationController
  include Pundit
  before_action :set_student, only: %i[edit update destroy]

  def index
    authorize Student
    @presenter = StudentPresenter.new(params)
    @pagy, @students = @presenter.paginate
  end

  def show
    authorize Student

    @student = StudentPresenter.new(params).student
    @comments = @student.comments.decorate
                                  .order(created_at: :desc)
                                  .group_by{ |c| c.created_at.to_date }
  end

  def new; end

  def delete_modal
    @student = Student.find(params[:student_id])
  end

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

  def destroy
    authorize @student
    return redirect_to students_path, success: t('.deleted') if @student.destroy!

    redirect_to students_path, warning: t('.not_deleted')
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student)
          .except(:favourite_subjects, :subject_difficulty)
          .permit(:first_name, :last_name, :birth_date,
                  :address, :school_grade, :attends)
  end
end
