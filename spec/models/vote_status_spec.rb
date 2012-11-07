# encoding: utf-8
require "spec_helper"

describe VoteStatus do
  COOKIE_NAME = VoteStatus::COOKIE_NAME

  def create_vs(data = nil)
    VoteStatus.new(COOKIE_NAME => data ? JSON.dump(data) : nil)
  end

  context "#initialize" do
    it "loads votes from cookie" do
      vs = create_vs(Votes: %w[a b c])
      vs.votes.should == %w[a b c]
    end

    it "ignores blank cookie passed" do
      vs = create_vs
      vs.votes.should == []
    end
  end

  context "#voted_for?" do
    let(:vs) { create_vs(Votes: %w[a b c]) }

    it { vs.voted_for?(stub code: "a").should be_true }
    it { vs.voted_for?(stub code: "z").should_not be_true }
  end

  context "#vote_for" do
    context "now allow" do
      it "should not allow if too much votes" do
        vs = create_vs(Votes: ["a"] * 100)
        vs.vote_for(stub).should be_false
      end

      it "should not allow if already voted" do
        vs = create_vs(Votes: ["a"])
        vs.vote_for(stub code: "a").should be_false
      end
    end

    context "allow" do
      let(:taste) { stub(code: "a") }

      it "should update cookie" do
        cookies = { COOKIE_NAME => nil }
        vs = VoteStatus.new(cookies)
        vs.vote_for taste.as_null_object
        cookies[COOKIE_NAME].should == JSON.dump(Votes: ["a"])
      end

      it "should add vote to taste" do
        taste.should_receive :add_vote
        create_vs.vote_for taste
      end
    end
  end

  context "#unvote_for" do
    let(:taste) { stub(code: "a") }

    it "should not allow unless voted" do
      create_vs.unvote_for(taste).should be_false
    end

    it "should update cookie" do
      cookies = { COOKIE_NAME => JSON.dump(Votes: ["a"]) }
      vs = VoteStatus.new(cookies)
      vs.unvote_for taste.as_null_object
      cookies[COOKIE_NAME].should == JSON.dump(Votes: [])
    end

    it "should remove vote from taste" do
      taste.should_receive :remove_vote
      create_vs(Votes: ["a"]).unvote_for taste
    end
  end
end
