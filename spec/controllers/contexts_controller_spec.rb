require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe ContextsController do

  def mock_context(stubs={})
    @mock_context ||= mock_model(Context, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all contexts as @contexts" do
      Context.stub(:all) { [mock_context] }
      get :index
      assigns(:contexts).should eq([mock_context])
    end
  end

  describe "GET show" do
    it "assigns the requested context as @context" do
      Context.stub(:find).with("37") { mock_context }
      get :show, :id => "37"
      assigns(:context).should be(mock_context)
    end
  end

  describe "GET new" do
    it "assigns a new context as @context" do
      Context.stub(:new) { mock_context }
      get :new
      assigns(:context).should be(mock_context)
    end
  end

  describe "GET edit" do
    it "assigns the requested context as @context" do
      Context.stub(:find).with("37") { mock_context }
      get :edit, :id => "37"
      assigns(:context).should be(mock_context)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created context as @context" do
        Context.stub(:new).with({'these' => 'params'}) { mock_context(:save => true) }
        post :create, :context => {'these' => 'params'}
        assigns(:context).should be(mock_context)
      end

      it "redirects to the created context" do
        Context.stub(:new) { mock_context(:save => true) }
        post :create, :context => {}
        response.should redirect_to(context_url(mock_context))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved context as @context" do
        Context.stub(:new).with({'these' => 'params'}) { mock_context(:save => false) }
        post :create, :context => {'these' => 'params'}
        assigns(:context).should be(mock_context)
      end

      it "re-renders the 'new' template" do
        Context.stub(:new) { mock_context(:save => false) }
        post :create, :context => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested context" do
        Context.stub(:find).with("37") { mock_context }
        mock_context.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :context => {'these' => 'params'}
      end

      it "assigns the requested context as @context" do
        Context.stub(:find) { mock_context(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:context).should be(mock_context)
      end

      it "redirects to the context" do
        Context.stub(:find) { mock_context(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(context_url(mock_context))
      end
    end

    describe "with invalid params" do
      it "assigns the context as @context" do
        Context.stub(:find) { mock_context(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:context).should be(mock_context)
      end

      it "re-renders the 'edit' template" do
        Context.stub(:find) { mock_context(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested context" do
      Context.stub(:find).with("37") { mock_context }
      mock_context.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the contexts list" do
      Context.stub(:find) { mock_context }
      delete :destroy, :id => "1"
      response.should redirect_to(contexts_url)
    end
  end

end
