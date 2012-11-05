# encoding: utf-8

class VoteStatus
  COOKIE_NAME = "TF_VOTES"
  MAX_VOTES_FROM_PERSON = 99

  attr_reader :votes, :cookies

  def initialize(cookies)
    @cookies  = cookies
    data      = load_json(cookies[COOKIE_NAME])
    @votes    = data["Votes"] || []
  end

  def voted_for?(taste)
    taste.code.in?(votes)
  end

  def vote_for(taste)
    return false if !can_vote? || voted_for?(taste)
    taste.add_vote
    votes << taste.code
    update_cookie
    true
  end

  def unvote_for(taste)
    return false unless voted_for?(taste)
    taste.remove_vote
    votes.delete(taste.code)
    update_cookie
    true
  end

  def as_json(*)
    {
      Votes: votes,
    }
  end

  private

  def can_vote?
    votes.size < MAX_VOTES_FROM_PERSON
  end

  def load_json(source)
    JSON.parse(source) rescue {}
  end

  def update_cookie
    cookies[COOKIE_NAME] = JSON.dump(as_json)
  end
end
