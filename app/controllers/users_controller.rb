class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create, :index]

  def index
    @users = User.includes(:skills).all.order('last_name ASC')
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully signed up"
      redirect_to profile_user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Successfully updated."
      redirect_to profile_user_path @user
    else
      render 'edit'
    end
  end

  def profile
    num = 3 - @user.skills.length
    num.times { @user.skills.build }
  end

  def save_profile
    if @user.update(user_params)
      flash[:success] = "Profile saved"
      redirect_to @user
    else
      redirect_to profile_user_path @user
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User has been deleted."
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
      :dept, :extn, skills_attributes: [:id, :description])
  end

  def set_user
    @user = User.find params[:id]
  end
end
