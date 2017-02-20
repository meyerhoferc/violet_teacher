class EnrollmentsController < ApplicationController
  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if current_student
      @enrollment.update_attributes(student: current_student)
      @enrollment.save
      flash[:success] = "Enrollment successful"
      redirect_to student_path(current_student)
    elsif !current_student
      flash[:danger] = "You must be logged in to enroll in a course"
      redirect_to login_student_path
    else
      flash[:danger] = "Enrollment not successful"
      render :new
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:course_id)
  end
end
