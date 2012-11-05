# encoding: utf-8

class PageController < ApplicationController
  layout "inner", only: %w[about career]

  def index
  end

  def about
  end

  def career
    if params[:page].present?
      if SUBPAGES[:career][params[:page]]
        render "page/career/#{params[:page]}"
      else
        raise_404
      end
    end
  end
end
