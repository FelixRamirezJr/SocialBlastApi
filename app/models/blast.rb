class Blast < ApplicationRecord
  belongs_to :user
  enum network_type: [:facebook, :twitter]

  module Networks
    Facebook  = "facebook"
    Twitter = "twitter"
    Tumblr = "tumblr"
  end

  def self.twitter( message, photo = nil )
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "hjiiNZpvH4lsQ7TZDrLB5KliB"
      config.consumer_secret     = "8uJYSCCGAc2rMsfSJHaBICve7SJfuru5SGeVtJmkffaI4vKOJA"
      config.access_token        = user.twitter_token
      config.access_token_secret = user.twitter_secret
    end
    toSend = message
    toSend = toSend + photo if photo
    client.update(toSend)
  end

  def self.facebook( message, photo = nil )

  end


end
