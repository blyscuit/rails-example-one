require 'rails_helper'

RSpec.describe "search_terms/edit", type: :view do
  let(:search_term) {
    SearchTerm.create!(
      keyword: "MyString"
    )
  }

  before(:each) do
    assign(:search_term, search_term)
  end

  it "renders the edit search_term form" do
    render

    assert_select "form[action=?][method=?]", search_term_path(search_term), "post" do

      assert_select "input[name=?]", "search_term[keyword]"
    end
  end
end
