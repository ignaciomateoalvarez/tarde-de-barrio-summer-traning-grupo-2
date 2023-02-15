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
    @student = User.new(student_params)
    if @student.save
      redirect_to users_path, notice: 'Created Student successfully'
    else
      redirect_to users_path, alert: 'Could not create Student'
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def student_params
    params.require(:student)
          .permit(:first_name, :last_name, :birth_date,
                  :address, :school_grade, :attends)
  end
end
