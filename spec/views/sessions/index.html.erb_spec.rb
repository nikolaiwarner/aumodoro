require 'spec_helper'

describe "sessions/index.html.erb" do
  before(:each) do
    assign(:sessions, [
      stub_model(Session,
        :success => "",
        :user_id => 1,
        :project_id => 1,
        :description => "MyText",
        :value => 1.5
      ),
      stub_model(Session,
        :success => "",
        :user_id => 1,
        :project_id => 1,
        :description => "MyText",
        :value => 1.5
      )
    ])
  end

  it "renders a list of sessions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
