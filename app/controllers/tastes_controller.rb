# encoding: utf-8

class TastesController < ApplicationController
  layout "inner"

  def index
    load_tastes
  end

  def show
    @taste = Taste.find_by_code!(params[:code])

    if request.xhr?
      render partial: "tastes/large_taste", locals: { taste: @taste }
    else
      load_tastes
      render "index"
    end
  end

  def topings
  end

  def top
    @tastes = Taste.top(params[:max])
  end

  def foodenergy
  end

  private

  def load_tastes
    @tastes = {
        regular: Taste.where(kind: 0).order("sort_order"),
        soy: Taste.where(kind: 1).order("sort_order"),
        sherbets: Taste.where(kind: 2).order("sort_order")
    }
  end
end
