# encoding: utf-8

class SessionsController < ApplicationController
  def create
    user = User.from_omniauth env["omniauth.auth"]
    sign_in(user)
  end

  def destroy
    sign_out
    redirect_to :tastes
  end
end
