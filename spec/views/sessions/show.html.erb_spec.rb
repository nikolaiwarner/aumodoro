require 'spec_helper'

describe "sessions/show.html.erb" do
  before(:each) do
    @session = assign(:session, stub_model(Session,
      :success => "",
      :user_id => 1,
      :project_id => 1,
      :description => "MyText",
      :value => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
