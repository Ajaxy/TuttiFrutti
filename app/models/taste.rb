# encoding: utf-8

class Taste < ActiveRecord::Base
  # has_many :votes

  def self.top(max)
    order("votes DESC").limit(max.present? ? max.to_i : 12)
  end

  def add_vote
    increment!(:votes)
  end

  def remove_vote
    decrement!(:votes) if votes > 0
  end

  def to_param
    code
  end
end
