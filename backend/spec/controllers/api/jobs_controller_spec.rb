require 'rails_helper'

RSpec.describe Api::JobsController, type: :controller do
  describe "GET #index" do
    let!(:job1) { create(:job, title: "Ruby Developer", country: "USA", stack: "Ruby") }
    let!(:job2) { create(:job, title: "React Developer", country: "Canada", stack: "React") }

    it "returns a paginated list of jobs" do
      get :index, params: { page: 1, per_page: 1 }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(1)
    end

    it "filters jobs by query" do
      get :index, params: { query: "Ruby" }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).first["title"]).to eq("Ruby Developer")
    end

    it "filters jobs by country" do
      get :index, params: { country: "Canada" }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).first["country"]).to eq("Canada")
    end

    it "filters jobs by stack" do
      get :index, params: { stack: "React" }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).first["stack"]).to eq("React")
    end
  end
end
