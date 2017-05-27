class UsersController < ActionController::API

  def show
    render json: User.find(params[:id])
  end

  def new
    if( params[:email].present? && params[:password].present? )
      user = User.new do |u|
        user.email = params[:email]
        user.password = params[:password]
        user.password_confirmation = params[:password_confirmation]
      end
      user.save!
      render json: user
    else
      render json: "false"
    end
  end

end
