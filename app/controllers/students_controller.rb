class StudentsController < ApplicationController
  before_action :authorized_student_access?
  skip_before_action :authorized_student_access?, only: [:new, :create]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      session[:student_id] = @student.id
      redirect_to student_path(current_student)
    else
      render :new
    end
  end

  def show
    @student = current_student
  end

  def edit
  end

  def update
    @student = current_student
    if @student.update(student_params)
      flash[:success] = "Information Updated"
      redirect_to student_path(current_student)
    else
      flash[:danger] = "Invalid Information"
      render :edit
    end
  end

  def destroy
    current_student.destroy
    flash[:danger] = "Account Deleted"
    redirect_to new_student_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :grade, :username, :password)
  end
end
