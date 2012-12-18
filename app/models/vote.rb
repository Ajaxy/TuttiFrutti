# encoding: utf-8

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :taste
end
