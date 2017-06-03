class Blast < ApplicationRecord
  belongs_to :user
  enum network_type: [:facebook, :twitter]

  module Networks
    Facebook  = "facebook"
    Twitter = "twitter"
    Tumblr = "tumblr"
  end


end
