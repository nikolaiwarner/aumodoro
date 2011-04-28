require 'spec_helper'

describe "contexts/edit.html.erb" do
  before(:each) do
    @context = assign(:context, stub_model(Context,
      :name => "MyString",
      :default_session_value => 1.5,
      :default_color_value => "",
      :user_id => 1
    ))
  end

  it "renders the edit context form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => context_path(@context), :method => "post" do
      assert_select "input#context_name", :name => "context[name]"
      assert_select "input#context_default_session_value", :name => "context[default_session_value]"
      assert_select "input#context_default_color_value", :name => "context[default_color_value]"
      assert_select "input#context_user_id", :name => "context[user_id]"
    end
  end
end
