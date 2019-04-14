require 'rails_helper'
RSpec.describe Api::HerosController do
  describe 'GET #index' do
    before do
      get :index
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'JSON body response contains expected heros attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(%w[data metadata per_page])
    end
  end

  describe 'GET #show' do
    before do
      @hero = create(:hero)
      get :show, params: { id: @hero.id }
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'JSON body response contains expected heros attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response['data']['id']).to eq(@hero.id)
    end
  end

  describe 'GET #heros/ability' do
    before do
      @hero = create(:hero)
      @ability = create(:ability, hero: @hero)
      get :abilities, params: { id: @hero.id }
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'JSON body response contains expected heros attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response['data'].first['id']).to eq(@ability.id)
    end
  end
end
