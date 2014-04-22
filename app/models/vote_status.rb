# encoding: utf-8

class VoteStatus
  MAX_VOTES_FROM_PERSON = 99

  attr_reader :votes, :user

  def initialize(user)
    @user  = user
    @votes = user.votes if user
  end

  def voted_for?(taste)
    return false unless user
    taste.code.in?(vote_codes)
  end

  def vote_for(taste)
    return false if !can_vote? || voted_for?(taste)
    user.votes << Vote.new(taste: taste)
    user.save!
    taste.add_vote
    true
  end

  def unvote_for(taste)
    return false unless voted_for?(taste)
    user.votes.find { |vote| vote.taste == taste }.destroy
    user.votes(true)
    taste.remove_vote
    true
  end

  def as_json(*)
    { Votes: vote_codes }
  end

  private

  def can_vote?
    user && votes.size < MAX_VOTES_FROM_PERSON
  end

  def vote_codes
    votes ? votes.map { |vote| vote.taste.present? && vote.taste.code } : []
  end
end
