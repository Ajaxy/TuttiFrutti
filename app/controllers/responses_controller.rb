# encoding: utf-8

class ResponsesController < ApplicationController
  layout "inner"

  def create
    @response = Response.new(params[:response])
    @response.position = params[:page]

    if @response.valid?
      ResponsesMailer.notify(@response).deliver
    else
      render "page/career/#{@response.position}"
    end
  end
end
