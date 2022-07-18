require 'rails_helper'
RSpec.describe Api::VesselController, type: :request do
  let(:headers) do
    { 'x-api-key' => "shippo", 'Content-Type' => 'application/json' }
  end
  FactoryBot.create(:vessel)
  vessel = FactoryBot.build(:vessel)
  post_vessel = {
    name: vessel.name,
    owner_id: vessel.owner_id,
    naccs_code: vessel.naccs_code
  }

  describe 'POST #create' do
    context 'without x-api-key in header' do
      def create_vessel(param)
        post api_create_vessel_path, params: param, as: :json
      end

      it 'should return unauthorized' do
        create_vessel post_vessel
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'parameters is correct' do
      def create_vessel(param)
        post api_create_vessel_path, params: param, headers: headers, as: :json
      end
      it 'returns http success' do
        create_vessel post_vessel
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET #index' do
    def create_vessel(param)
      post api_create_vessel_path, params: param, headers: headers, as: :json
    end

    context 'return list of vessel' do
      def get_vessel
        create_vessel post_vessel
        response = get api_vessel_path, headers: headers, as: :json
        expect(response.body_as_json[:data].size).to be > 0
      end
    end
  end

  describe 'PATCH #update' do
    def update_vessel(param)
      patch api_update_vessel_path, params: param, headers: headers, as: :json
    end

    context 'return list of vessel' do
      def get_vessel
        v = post_vessel.clone
        v.name = "test-sudhan"
        update_vessel v
        expect(response.body_as_json[:data].size).to be > 0
      end
    end
  end
end
