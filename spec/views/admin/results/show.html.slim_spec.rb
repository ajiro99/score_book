require 'rails_helper'

RSpec.describe "admin/results/show", type: :view do
  before(:each) do
    @admin_result = assign(:admin_result, Result.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
