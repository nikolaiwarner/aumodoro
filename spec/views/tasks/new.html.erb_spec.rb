require 'spec_helper'

describe "tasks/new.html.erb" do
  before(:each) do
    assign(:task, stub_model(Task,
      :project_id => 1,
      :user_id => "",
      :name => "MyString",
      :notes => "MyText",
      :complete => false
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_project_id", :name => "task[project_id]"
      assert_select "input#task_user_id", :name => "task[user_id]"
      assert_select "input#task_name", :name => "task[name]"
      assert_select "textarea#task_notes", :name => "task[notes]"
      assert_select "input#task_complete", :name => "task[complete]"
    end
  end
end
