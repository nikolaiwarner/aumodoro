require 'spec_helper'

describe "groups/index.html.erb" do
  before(:each) do
    assign(:groups, [
      stub_model(Group,
        :name => "Name",
        :default_session_value => 1.5,
        :default_color_value => "",
        :user_id => 1
      ),
      stub_model(Group,
        :name => "Name",
        :default_session_value => 1.5,
        :default_color_value => "",
        :user_id => 1
      )
    ])
  end

  it "renders a list of groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
