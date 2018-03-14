require 'rails_helper'

RSpec.describe "admin/results/edit", type: :view do
  before(:each) do
    @admin_result = assign(:admin_result, Result.create!())
  end

  it "renders the edit admin_result form" do
    render

    assert_select "form[action=?][method=?]", admin_result_path(@admin_result), "post" do
    end
  end
end
