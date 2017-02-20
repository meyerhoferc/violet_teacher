class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    teacher = Teacher.find_by(name: params[:course][:teacher])
    subject = Subject.find_by(name: params[:course][:subject])
    @course = Course.new(course_params)
    @course.update_attributes(teacher: teacher, subject: subject)
    if @course.save
      flash[:success] = "Course created successfully"
      redirect_to course_path(@course)
    else
      flash[:danger] = "Course not created!"
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :location)
  end
end
