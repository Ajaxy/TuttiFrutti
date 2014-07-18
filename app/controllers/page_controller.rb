# encoding: utf-8

class PageController < ApplicationController
  layout "inner", only: %w[about career card contact]

  def index
  end

  def about
  end

  def card
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

  def contact

  end

  def franchising
    unless params[:submit].nil?
      FranchisingMailer.notify(params).deliver
    end
  end
end
