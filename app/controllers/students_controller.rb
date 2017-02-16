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

  private

  def student_params
    params.require(:student).permit(:name, :grade, :username, :password)
  end
end
