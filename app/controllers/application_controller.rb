class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
  end
  helper_method :current_user

  def sign_in(user)
    cookies.signed.permanent[:user_id] = user.id
  end

  def sign_out
    cookies.signed.permanent[:user_id] = nil
  end

  def vote_status
    @vote_status ||= VoteStatus.new(current_user)
  end
  helper_method :vote_status

  def raise_404
    raise ActionController::RoutingError.new("404 error")
  end
end
