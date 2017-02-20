class SubjectsController < ApplicationController
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
    @subject = Subject.find(params[:id])
  end

  def index
    @subjects = Subject.all
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      flash[:success] = "Information Updated"
      redirect_to subject_path(@subject)
    else
      flash[:danger] = "Invalid Information"
      render :edit
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:danger] = "Subject Deleted"
    redirect_to subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end
end
