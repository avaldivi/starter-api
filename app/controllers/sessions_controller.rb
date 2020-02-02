class SessionsController < Devise::SessionsController
  before_action :authenticate_user!
  #respond_to :json

  def create
    user = User.find_by_email(sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      @current_user = user
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end
  
  private

  # def respond_with(resource, _opts = {})
  #   render json: resource
  # end

  # def respond_to_on_destroy
  #   head :ok
  # end
end