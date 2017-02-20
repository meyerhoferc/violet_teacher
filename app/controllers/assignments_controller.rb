class AssignmentsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @assignment = Assignment.new
  end

  def create
    @course = Course.find(params[:course_id])
    @assignment = Assignment.new(assignment_params)
    @assignment.update_attributes(course: @course)
    if @assignment.save
      flash[:success] = "Assignment created successfully"
      redirect_to teacher_course_assignment_path(current_teacher, @course, @assignment)
    else
      flash[:danger] = "Assignment not created successfully"
      render :new
    end
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  private

  def assignment_params
    params.require(:assignment).permit(:title, :point_value, :course_id, :teacher_id)
  end
end
