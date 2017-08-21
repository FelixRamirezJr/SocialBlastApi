class BlastsController < ApplicationController

  def update_blasts
    user = User.find(params[:id])
    user.blasts.update(active: false)
    list = params[:blast_list].split(params[:delimeter])
    user.blasts.where(name: list).update(active: true)
    render json: user.blasts.where(active: true)
  end

  def get_blast_list
    render json: User.find(params[:id]).blasts
  end

  def get_active_blast_list
    render json: User.find(params[:id]).blasts.where(active: true)
  end

  def toggle_active
    Blast.find(params[:id]).update_column(:active,params[:active])
    return render json: "okay"
  end

  def blast_to_twitter
    user = User.find(params[:id])
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "hjiiNZpvH4lsQ7TZDrLB5KliB"
      config.consumer_secret     = "8uJYSCCGAc2rMsfSJHaBICve7SJfuru5SGeVtJmkffaI4vKOJA"
      config.access_token        = user.twitter_token
      config.access_token_secret = user.twitter_secret
    end
    client.update(params[:message])
    return user
  end

  def blast_with_photo
    user = User.find(params[:id])
    send_blast = user.sent_blasts.create(message: params[:message])
    send_blast.picture = params[:photo].open
    if send_blast.save!
      # Blast to twitter
      render json: sent_blast
    else
      render json: "error"
    end
  end

  def test_image
    sent_blast = User.first.sent_blasts.create(message: "YAY!")
    sent_blast.picture = Rails.root.join("picture.png").open
    sent_blast.save!
    render json: "okay"
  end

end
