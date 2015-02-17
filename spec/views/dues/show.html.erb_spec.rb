require 'rails_helper'

RSpec.describe "dues/show", type: :view do
  before(:each) do
    @due = assign(:due, Due.create!(
      :due_by => nil,
      :due_to => nil,
      :due_from => nil,
      :amount => "",
      :payment => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
