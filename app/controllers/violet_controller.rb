class VioletController < ApplicationController
  def courses
    @courses = Course.all
  end
end
