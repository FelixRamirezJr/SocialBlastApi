class UsersController < ActionController::API

  def show
      render :json => User.find(params[:id]).to_json(:include => [:blasts])
  end

  # will login the user
  def login
    if( params[:email].present? && params[:password].present? )
      user = User.find_by_email(params[:email])
      if user && user.valid_password?(params[:password])
        render json: user
      else
        render json: "error"
      end
    else
      render json: "error"
    end
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
      if user.blasts.where(name: Blast::Networks::Facebook).size == 0
        user.blasts.create(name: Blast::Networks::Facebook, active: false)
      end
      render json: user
    else
      render json: "false"
    end
  end

  def set_facebook_basic_info
    if params[:id].present?
      user = User.find(params[:id])
      user.update_column(:fb_name, params[:fb_name]) if params[:fb_name].present?
      user.update_column(:fb_email, params[:fb_email]) if params[:fb_email].present?
      user.update_column(:fb_user_id, params[:fb_user_id] ) if params[:fb_user_id].present?
      user.update_column(:fb_token, params[:token] ) if params[:token].present?
      render json: user
    else
      render json: "false"
    end
  end


  def set_twitter_basic_info
    puts params.inspect
    user = User.find(params[:id])
    user.update(
      twitter_user_id: params[:twitter_user_id],
      twitter_token: params[:twitter_token],
      twitter_secret: params[:twitter_secret],
      twitter_username: params[:twitter_username]
    )
    if user.blasts.where(name: Blast::Networks::Twitter).size == 0
      user.blasts.create(name: Blast::Networks::Twitter, active: false)
    end
    render json: user
  end

end
