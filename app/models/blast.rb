class Blast < ApplicationRecord
  belongs_to :user
  enum network_type: [:facebook, :twitter]
end
