# encoding: utf-8

class TastesController < ApplicationController
  layout "inner"

  def index
    @tastes = Taste.order("id")
  end

  def show
    @taste = Taste.find_by_code!(params[:code])

    if request.xhr?
      render partial: "tastes/large_taste", locals: { taste: @taste }
    else
      @tastes = Taste.order("id")
      render "index"
    end
  end

  def topings
  end

  def top
    @tastes = Taste.top(params[:max])
  end
end
