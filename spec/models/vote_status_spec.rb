# encoding: utf-8
require "spec_helper"

describe VoteStatus do
  def create_taste(code)
    Taste.create!(code: code)
  end

  def votes(vs)
    vs.as_json[:Votes]
  end

  let(:user)  { User.create! }
  let(:vs)    { VoteStatus.new(user) }
  let(:taste) { create_taste("foo") }

  describe "#vote_for" do
    it "creates new vote for a taste" do
      vs.vote_for create_taste("foo")
      votes(vs).should == ["foo"]

      vs.vote_for create_taste("bar")
      votes(vs).should == ["foo", "bar"]
    end

    it "doesn't let to vote twice for the one taste" do
      vs.vote_for(taste).should be_true
      vs.vote_for(taste).should be_false
    end

    it "returns false if there is no current user" do
      vs = VoteStatus.new(nil)
      vs.vote_for(taste).should be_false

      votes(vs).should == []
    end
  end

  describe "#unvote_for" do
    it "removes vote for a taste" do
      vs.vote_for(taste)
      votes(vs).size.should == 1

      vs.unvote_for(taste)
      votes(vs).size.should == 0
    end

    it "returns false if there is no vote for taste" do
      vs.unvote_for(taste).should be_false

      vs.vote_for(taste)
      vs.unvote_for(taste).should be_true

      vs.unvote_for(taste).should be_false
    end

    it "returns false if there is no current user" do
      vs = VoteStatus.new(nil)

      vs.vote_for(taste)
      vs.unvote_for(taste).should be_false
    end
  end

  describe "#voted_for?" do
    it "returns whether user already voted for taste" do
      vs.voted_for?(taste).should be_false

      vs.vote_for(taste)
      vs.voted_for?(taste).should be_true

      vs.unvote_for(taste)
      vs.voted_for?(taste).should be_false
    end

    it "returns false if there is no current user" do
      vs = VoteStatus.new(nil)

      vs.voted_for?(taste).should be_false

      vs.vote_for(taste)
      vs.voted_for?(taste).should be_false
    end
  end
end
