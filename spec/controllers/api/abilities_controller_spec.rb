require 'rails_helper'
RSpec.describe Api::AbilitiesController do
  describe "GET #index" do
    before do
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected heros attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(['abilities'])
    end
  end

  describe "GET #show" do
    before do
      @ability = create(:ability)
      get :show, params: {id: @ability.id}
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected heros attributes" do
      json_response = JSON.parse(response.body)
      puts json_response['ability']
      expect(json_response['ability']['id']).to eq(@ability.id)
    end
  end
end