require "rails_helper"

RSpec.describe SearchTermsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/search_terms").to route_to("search_terms#index")
    end

    it "routes to #new" do
      expect(get: "/search_terms/new").to route_to("search_terms#new")
    end

    it "routes to #show" do
      expect(get: "/search_terms/1").to route_to("search_terms#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/search_terms/1/edit").to route_to("search_terms#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/search_terms").to route_to("search_terms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/search_terms/1").to route_to("search_terms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/search_terms/1").to route_to("search_terms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/search_terms/1").to route_to("search_terms#destroy", id: "1")
    end
  end
end
