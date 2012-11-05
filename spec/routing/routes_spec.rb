# encoding: utf-8
require "spec_helper"

describe "Routes" do
  it { get("/") .should route_to("page#index") }
  it { get("/about").should route_to("page#about") }
  it { get("/career").should route_to("page#career") }
  it { get("/career/manager").should route_to("page#career", page: "manager") }
  it { get("/career/economist").should route_to("page#career", page: "economist") }
  it { get("/tastes").should route_to("tastes#index") }
  it { get("/tastes/top").should route_to("tastes#top") }
  it { get("/tastes/topings").should route_to("tastes#topings") }
end
