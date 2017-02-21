class VioletController < ApplicationController
  def main
  end

  def courses
    @courses = Course.all
  end

  def about
  end
end
