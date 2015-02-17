require 'rails_helper'

RSpec.describe "dues/edit", type: :view do
  before(:each) do
    @due = assign(:due, Due.create!(
      :due_by => nil,
      :due_to => nil,
      :due_from => nil,
      :amount => "",
      :payment => nil
    ))
  end

  it "renders the edit due form" do
    render

    assert_select "form[action=?][method=?]", due_path(@due), "post" do

      assert_select "input#due_due_by_id[name=?]", "due[due_by_id]"

      assert_select "input#due_due_to_id[name=?]", "due[due_to_id]"

      assert_select "input#due_due_from_id[name=?]", "due[due_from_id]"

      assert_select "input#due_amount[name=?]", "due[amount]"

      assert_select "input#due_payment_id[name=?]", "due[payment_id]"
    end
  end
end
