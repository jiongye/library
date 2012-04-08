class CoursesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params[:course])

    if @course.save
      redirect_to courses_path, :notice => 'The new course was successfully created'
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(params[:course])
      redirect_to courses_path, :notice => 'The course was successfully updated'
    else
      render :action => "edit"
    end
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy
    redirect_to courses_path, :notice => "The course was successfully deleted"
  end

end
