require 'rails_helper'

RSpec.describe "search_terms/show", type: :view do
  before(:each) do
    assign(:search_term, SearchTerm.create!(
      keyword: "Keyword"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Keyword/)
  end
end
