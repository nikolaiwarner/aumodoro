require 'spec_helper'

describe "projects/edit.html.erb" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "MyString",
      :user_id => 1,
      :group_id => 1,
      :session_count => 1,
      :description => "MyText",
      :color => "MyString",
      :total_sessions_estimate => 1,
      :priority => 1
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => project_path(@project), :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "input#project_user_id", :name => "project[user_id]"
      assert_select "input#project_group_id", :name => "project[group_id]"
      assert_select "input#project_session_count", :name => "project[session_count]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "input#project_color", :name => "project[color]"
      assert_select "input#project_total_sessions_estimate", :name => "project[total_sessions_estimate]"
      assert_select "input#project_priority", :name => "project[priority]"
    end
  end
end
