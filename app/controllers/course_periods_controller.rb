class CoursePeriodsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @course_periods = CoursePeriod.all
  end

  def new
    @course_period = CoursePeriod.new
  end

  def create
    @course_period = CoursePeriod.new(params[:course_period])

    if @course_period.save
      redirect_to course_periods_path, :notice => 'The new class period was successfully created'
    else
      render 'new'
    end
  end

  def edit
    @course_period = CoursePeriod.find(params[:id])
  end

  def update
    @course_period = CoursePeriod.find(params[:id])

    if @course_period.update_attributes(params[:course_period])
      redirect_to course_periods_path, :notice => 'The class period was successfully updated'
    else
      render :action => "edit"
    end
  end

  def destroy
    @course_period = CoursePeriod.find(params[:id])

    @course_period.destroy
    redirect_to course_periods_path, :notice => "The class period was successfully deleted"
  end

end
