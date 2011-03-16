require 'spec_helper'

describe "groups/edit.html.erb" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :name => "MyString",
      :default_session_value => 1.5,
      :default_color_value => "",
      :user_id => 1
    ))
  end

  it "renders the edit group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => group_path(@group), :method => "post" do
      assert_select "input#group_name", :name => "group[name]"
      assert_select "input#group_default_session_value", :name => "group[default_session_value]"
      assert_select "input#group_default_color_value", :name => "group[default_color_value]"
      assert_select "input#group_user_id", :name => "group[user_id]"
    end
  end
end
