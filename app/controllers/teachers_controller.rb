class TeachersController < ApplicationController
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(current_teacher)
    else
      render :new
    end
  end

  def show
    @teacher = current_teacher
  end

  def login
  end

  def validate_login
    @teacher = Teacher.find_by(username: params[:session][:username])
    if @teacher && @teacher.authenticate(params[:session][:password])
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(current_teacher)
    else
      flash[:danger] = "Invalid Login Credentials"
      render :login
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :department, :username, :password)
  end
end
