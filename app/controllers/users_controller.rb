class UsersController < ActionController::API

  def show
    render json: User.find(params[:id])
  end

end
