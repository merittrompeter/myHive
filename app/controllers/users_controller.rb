class UsersController < ApplicationController

def new
  @user = User.new
  render layout: false
end

def create
  @user = User.create user_params
  if @user.persisted?
    flash[:success] = "welcome to myHive!"
    redirect_to root_path
  else
    flash[:danger] = @user.errors.full_messages.uniq.to_sentence
     redirect_to root_path
  end
end

private

def user_params
  params.require(:user).permit(:email, :password)
end

end
