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

  def test_image
    file = File.open("tmp/picture.png", "w+")
    User.first.sent_blasts.create(message: "YAY!", picture: file)
    render json: "okay"
  end

end
