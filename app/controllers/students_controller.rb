class StudentsController < ApplicationController
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

  def login
  end

  def validate_login
    @student = Student.find_by(username: params[:session][:username])
    if @student && @student.authenticate(params[:session][:password])
      session[:student_id] = @student.id
      redirect_to student_path(current_student)
    else
      flash[:danger] = "Invalid Login Credentials"
      render :login
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :grade, :username, :password)
  end
end
