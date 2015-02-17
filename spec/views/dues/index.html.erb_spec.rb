require 'rails_helper'

RSpec.describe "dues/index", type: :view do
  before(:each) do
    assign(:dues, [
      Due.create!(
        :due_by => nil,
        :due_to => nil,
        :due_from => nil,
        :amount => "",
        :payment => nil
      ),
      Due.create!(
        :due_by => nil,
        :due_to => nil,
        :due_from => nil,
        :amount => "",
        :payment => nil
      )
    ])
  end

  it "renders a list of dues" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
