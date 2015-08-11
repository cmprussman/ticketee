require 'rails_helper'

RSpec.describe "purchases/index", type: :view do
  before(:each) do
    assign(:purchases, [
      Purchase.create!(
        :name => "Name",
        :cost => 1
      ),
      Purchase.create!(
        :name => "Name",
        :cost => 1
      )
    ])
  end

  it "renders a list of purchases" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
