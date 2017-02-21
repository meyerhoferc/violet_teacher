class SessionsController < ApplicationController
  def teacher_login
    render :"teachers/login"
  end

  def teacher_validate_login
    @teacher = Teacher.find_by(username: params[:session][:username])
    if @teacher && @teacher.authenticate(params[:session][:password])
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(current_teacher)
    else
      flash[:danger] = "Invalid Login Credentials"
      render :"teachers/login"
    end
  end

  def teacher_logout
    session.clear
    flash[:notice] = "Logged Out"
    redirect_to login_teacher_path
  end

  def student_login
    render :"students/login"
  end

  def student_validate_login
    @student = Student.find_by(username: params[:session][:username])
    if @student && @student.authenticate(params[:session][:password])
      session[:student_id] = @student.id
      redirect_to student_path(current_student)
    else
      flash[:danger] = "Invalid Login Credentials"
      render :"students/login"
    end
  end

  def student_logout
    session.clear
    flash[:notice] = "Logged Out"
    redirect_to login_student_path
  end
end
