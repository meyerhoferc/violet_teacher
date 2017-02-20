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
    @course = Course.find(params[:course_id])
    @assignment = Assignment.find(params[:id])
  end

  def index
    @course = Course.find(params[:course_id])
    @assignments = Assignment.find_by(course: @course)
  end

  def edit
    @assignment = Assignment.find(params[:id])
    @course = Course.find(params[:course_id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    @course = Course.find(params[:course_id])
    if @assignment.update(assignment_params)
      flash[:success] = "Assignment updated"
      redirect_to teacher_course_assignment_path(current_teacher, @course, @assignment)
    else
      flash[:danger] = "Assignment not updated"
      render :edit
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit(:title, :point_value, :course_id, :teacher_id)
  end
end
