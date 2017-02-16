class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_teacher
  helper_method :current_student

  def current_teacher
    @teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end

  def current_student
    @student ||= Student.find(session[:student_id]) if session[:student_id]
  end
end
