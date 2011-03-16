require 'spec_helper'

describe "sessions/new.html.erb" do
  before(:each) do
    assign(:session, stub_model(Session,
      :success => "",
      :user_id => 1,
      :project_id => 1,
      :description => "MyText",
      :value => 1.5
    ).as_new_record)
  end

  it "renders new session form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sessions_path, :method => "post" do
      assert_select "input#session_success", :name => "session[success]"
      assert_select "input#session_user_id", :name => "session[user_id]"
      assert_select "input#session_project_id", :name => "session[project_id]"
      assert_select "textarea#session_description", :name => "session[description]"
      assert_select "input#session_value", :name => "session[value]"
    end
  end
end
