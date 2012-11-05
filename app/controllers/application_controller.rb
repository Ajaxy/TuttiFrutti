class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def vote_status
    @vote_status ||= VoteStatus.new(cookies)
  end
  helper_method :vote_status

  def raise_404
    raise ActionController::RoutingError.new("404 error")
  end
end
