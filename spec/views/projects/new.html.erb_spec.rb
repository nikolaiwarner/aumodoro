require 'spec_helper'

describe "projects/new.html.erb" do
  before(:each) do
    assign(:project, stub_model(Project,
      :name => "MyString",
      :user_id => 1,
      :context_id => 1,
      :session_count => 1,
      :description => "MyText",
      :color => "MyString",
      :total_sessions_estimate => 1,
      :priority => 1
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "input#project_user_id", :name => "project[user_id]"
      assert_select "input#project_context_id", :name => "project[context_id]"
      assert_select "input#project_session_count", :name => "project[session_count]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "input#project_color", :name => "project[color]"
      assert_select "input#project_total_sessions_estimate", :name => "project[total_sessions_estimate]"
      assert_select "input#project_priority", :name => "project[priority]"
    end
  end
end
