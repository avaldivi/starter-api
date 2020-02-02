class RegistrationsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.new(user_params)
    if user.save
      render json: { user: user }
      return
    else
      render json: { user: user.errors }
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end