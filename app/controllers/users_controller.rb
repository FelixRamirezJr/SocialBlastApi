class UsersController < ActionController::API

  def show
    render json: User.find(params[:id])
  end

  def new
    if( params[:email].present? && params[:password].present? )
      user = User.create(email: params[:email], password: params[:password],
                         password_confirmation: params[:password] )
      render json: user
    else
      render json: "false"
    end
  end

  def set_facebook_token
    if( params[:token].present? && params[:id].present? )
      user = User.find(params[:id])
      user.update_column(:fb_token, params[:token])
      render json: user
    else
      render json: "false"
    end
  end

  def set_facebook_basic_info
    if( params[:id].present? && params[:fb_name].present? &&
        params[:fb_email].present? && params[:token].present? )
      user = User.find(params[:id])
      user.update(fb_name: params[:fb_name], fb_email: params[:fb_email], fb_token: params[:token] )
      render json: user
    else
      render json: "false"
    end
  end

end
