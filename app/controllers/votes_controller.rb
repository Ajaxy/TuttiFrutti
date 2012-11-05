# encoding: utf-8

class VotesController < ApplicationController
  respond_to :json
  before_filter :find_taste, only: %w[create destroy]

  def index
    respond_with vote_status
  end

  def create
    respond_with vote_status.vote_for(@taste)
  end

  def destroy
    respond_with vote_status.unvote_for(@taste)
  end

  private

  def find_taste
    @taste = Taste.find_by_code!(params[:code])
  end
end
