require "spec_helper"

describe SessionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/sessions" }.should route_to(:controller => "sessions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/sessions/new" }.should route_to(:controller => "sessions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/sessions/1" }.should route_to(:controller => "sessions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/sessions/1/edit" }.should route_to(:controller => "sessions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/sessions" }.should route_to(:controller => "sessions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/sessions/1" }.should route_to(:controller => "sessions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/sessions/1" }.should route_to(:controller => "sessions", :action => "destroy", :id => "1")
    end

  end
end
