class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    if @user.profile.id == params[:id].to_i
      render :show
    else
      flash[:notice] = "You lie John Snow"
      redirect_to root_url
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = User.find(current_user)
    if @profile.save
      flash[:notice] = "Your profile has been saved!"
      redirect_to questions_path
    else
      flash[:notice] = "Your profile was not saved!"
      render :new
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :country, :image, :gender)
    end
end
