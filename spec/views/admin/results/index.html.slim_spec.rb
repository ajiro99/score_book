require 'rails_helper'

RSpec.describe "admin/results/index", type: :view do
  before(:each) do
    assign(:results, [
      Result.create!(),
      Result.create!()
    ])
  end

  it "renders a list of admin/results" do
    render
  end
end
