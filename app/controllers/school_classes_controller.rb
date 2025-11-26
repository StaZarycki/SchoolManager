class SchoolClassesController < ApplicationController
  before_action :authenticate_user!

  def index
    @school_class = SchoolClass.all
  end

  def show
    @school_class = SchoolClass.find(params[:id])
    @students = @school_class.students
    @teachers = @school_class.teachers
  end
end
