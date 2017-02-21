class AssignmentsController < ApplicationController
  before_action :set_course
  before_action :set_assignment, except: [:new, :create, :index]

  def new
    @assignment = Assignment.new
  end

  def create
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
  end

  def index
    @assignments = Assignment.find_by(course: @course)
  end

  def edit
  end

  def update
    if @assignment.update(assignment_params)
      flash[:success] = "Assignment updated"
      redirect_to teacher_course_assignment_path(current_teacher, @course, @assignment)
    else
      flash[:danger] = "Assignment not updated"
      render :edit
    end
  end

  def destroy
    @assignment.destroy
    flash[:success] = "Assignment deleted"
    redirect_to teacher_course_assignments_path(current_teacher, @course)
  end

  private

  def assignment_params
    params.require(:assignment).permit(:title, :point_value, :course_id, :teacher_id)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end
end
