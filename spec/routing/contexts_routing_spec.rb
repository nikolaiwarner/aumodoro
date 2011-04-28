require "spec_helper"

describe ContextsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/contexts" }.should route_to(:controller => "contexts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/contexts/new" }.should route_to(:controller => "contexts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/contexts/1" }.should route_to(:controller => "contexts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/contexts/1/edit" }.should route_to(:controller => "contexts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/contexts" }.should route_to(:controller => "contexts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/contexts/1" }.should route_to(:controller => "contexts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/contexts/1" }.should route_to(:controller => "contexts", :action => "destroy", :id => "1")
    end

  end
end
