# encoding: utf-8

class User < ActiveRecord::Base
  has_many :votes

  def self.from_omniauth(auth)
    provider = auth["provider"].to_s
    uid      = auth["uid"].to_s
    where(provider: provider, uid: uid).first_or_create!
  end
end
