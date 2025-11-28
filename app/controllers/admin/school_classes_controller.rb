class Admin::SchoolClassesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_school_class, only: [:show, :edit, :update, :destroy]

  def index
    @school_classes = SchoolClass.all.order(:name)
  end

  def show
    @students = @school_class.students
    @teachers = @school_class.teachers
  end

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.new(school_class_params)

    if @school_class.save
      redirect_to admin_school_classes_path, notice: "Class created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @school_class.update(school_class_params)
      redirect_to admin_school_classes_path, notice: "Class updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @school_class.students.any? || @school_class.teachers.any?
      redirect_to admin_school_classes_path, flash: { error: "Cannot delete class with assigned students or teachers" }
    else
      @school_class.destroy
      redirect_to admin_school_classes_path, notice: "Class deleted successfully"
    end
  end

  private

  def set_school_class
    @school_class = SchoolClass.find(params[:id])
  end

  def school_class_params
    params.require(:school_class).permit(:name, teacher_ids: [])
  end

  def require_admin
    unless current_user.administrator?
      redirect_to root_path, alert: "Access denied"
    end
  end
end
