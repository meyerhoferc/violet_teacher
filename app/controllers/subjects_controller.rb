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
    end
  end

  def show
    @subject = Subject.find(params[:id])
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end
end
