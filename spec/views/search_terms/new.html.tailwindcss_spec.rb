require 'rails_helper'

RSpec.describe "search_terms/new", type: :view do
  before(:each) do
    assign(:search_term, SearchTerm.new(
      keyword: "MyString"
    ))
  end

  it "renders new search_term form" do
    render

    assert_select "form[action=?][method=?]", search_terms_path, "post" do

      assert_select "input[name=?]", "search_term[keyword]"
    end
  end
end
