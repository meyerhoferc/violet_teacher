class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:success] = "Subject created successfully"
      redirect_to subject_path(@subject)
    else
      flash[:danger] = "Missing information"
      render :new
    end
  end

  def show
  end

  def index
    @subjects = Subject.all
  end

  def edit
  end

  def update
    if @subject.update(subject_params)
      flash[:success] = "Information Updated"
      redirect_to subject_path(@subject)
    else
      flash[:danger] = "Invalid Information"
      render :edit
    end
  end

  def destroy
    @subject.destroy
    flash[:danger] = "Subject Deleted"
    redirect_to subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end
end
