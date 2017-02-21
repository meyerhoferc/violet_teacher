class TeachersController < ApplicationController
  before_action :authorized_teacher_access?
  skip_before_action :authorized_teacher_access?, only: [:new, :create]

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(current_teacher)
    else
      render :new
    end
  end

  def show
    @teacher = current_teacher
  end

  def edit
  end

  def update
    @teacher = current_teacher
    if @teacher.update(teacher_params)
      flash[:success] = "Information Updated"
      redirect_to teacher_path(current_teacher)
    else
      flash[:danger] = "Invalid Information"
      render :edit
    end
  end

  def destroy
    current_teacher.destroy
    flash[:danger] = "Account Deleted"
    redirect_to new_teacher_path
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :department, :username, :password)
  end
end
