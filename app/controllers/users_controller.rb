class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create, :edit, :update]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      PictureMailer.picture_mail(@user).deliver
      redirect_to user_path(@user.id)
  	else
    	render :new
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to user_path(@user.id), notice: "Profil edited!"
    else
        render :edit
    end
  end
  
  def show
  	@user = User.find(params[:id])
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password,
                              	 :password_confirmation, :profil, :profil_cache)
  end

  def user_profil_params
    params.require(:user).permit(:name, :email,:profil, :profil_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
