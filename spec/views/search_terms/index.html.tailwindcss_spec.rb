require 'rails_helper'

RSpec.describe "search_terms/index", type: :view do
  before(:each) do
    assign(:search_terms, [
      SearchTerm.create!(
        keyword: "Keyword"
      ),
      SearchTerm.create!(
        keyword: "Keyword"
      )
    ])
  end

  it "renders a list of search_terms" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Keyword".to_s), count: 2
  end
end
