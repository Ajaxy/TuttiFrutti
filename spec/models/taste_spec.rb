# encoding: utf-8
require "spec_helper"

describe Taste do
  let(:taste) { Taste.create! code: "Foo" }

  context "#add_vote" do
    it "increments votes field" do
      taste.add_vote
      taste.reload.votes.should == 1
    end
  end

  context "#remove_vote" do
    it "does nothing if votes == 0" do
      taste.remove_vote
      taste.reload.votes.should == 0
    end

    it "decrements votes field" do
      taste.update_column :votes, 50
      taste.remove_vote
      taste.reload.votes.should == 49
    end
  end
end
