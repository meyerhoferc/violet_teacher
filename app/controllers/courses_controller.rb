class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.update_attributes(teacher: current_teacher)
    if @course.save
      flash[:success] = "Course created successfully"
      redirect_to teacher_course_path(current_teacher, @course)
    else
      flash[:danger] = "Course not created!"
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def index
    @courses = Course.all
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    flash[:success] = "Course updated successfully"
    redirect_to teacher_course_path(current_teacher, @course)
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:success] = "Course deleted successfully"
    redirect_to teacher_courses_path(current_teacher)
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :location, :teacher_id, :subject_id)
  end
end
