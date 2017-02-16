class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_teacher

  def current_teacher
    @teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end
end
