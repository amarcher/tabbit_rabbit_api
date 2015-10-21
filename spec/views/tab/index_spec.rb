require 'rails_helper'

RSpec.describe "tab/index" do
  let(:tab) { Tab.new(name: 'name') }

  before(:each) do
    assign(:tabs, [tab])
  end

  it "displays both widgets" do
    render
    expect(rendered).to match /name/
  end
end