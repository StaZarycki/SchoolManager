class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = SecureRandom.hex(10) if @user.password.blank?

    if @user.save
      redirect_to admin_users_path, notice: "User created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # Check if trying to change password
    if user_params[:password].present? || user_params[:password_confirmation].present?
      # If either password field is filled, validate both
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "User updated successfully"
      else
        render :edit, status: :unprocessable_entity
      end
    else
      # If both password fields are blank, update without password
      if @user.update(user_params.except(:password, :password_confirmation))
        redirect_to admin_users_path, notice: "User updated successfully"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @user == current_user
      redirect_to admin_users_path, error: "You cannot delete yourself"
    else
      @user.destroy
      redirect_to admin_uses_path, notice: "User deleted successfully"
    end
  end

  private

  def require_admin
    unless current_user.administrator?
      redirect_to root_path, alert: "Access denied"
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    permitted = [:email, :role, :password, :password_confirmation]
    permitted << :school_class_id if params[:user][:role] == "student"
    params.require(:user).permit(permitted)
  end
end