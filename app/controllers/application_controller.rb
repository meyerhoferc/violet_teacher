class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_teacher
  helper_method :current_student
  helper_method :authorized_teacher_access?
  helper_method :authorized_student_access?

  def current_teacher
    @teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end

  def current_student
    @student ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def authorized_teacher_access?
    render file: 'public/404' unless current_teacher
  end

  def authorized_student_access?
    render file: 'public/404' unless current_student
  end
end
