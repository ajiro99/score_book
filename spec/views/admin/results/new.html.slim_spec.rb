require 'rails_helper'

RSpec.describe "admin/results/new", type: :view do
  before(:each) do
    assign(:admin_result, Result.new())
  end

  it "renders new admin_result form" do
    render

    assert_select "form[action=?][method=?]", results_path, "post" do
    end
  end
end
