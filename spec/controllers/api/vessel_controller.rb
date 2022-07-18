require 'rails_helper'
RSpec.describe Api::VesselController, type: :request do
  describe 'POST #create' do
    let(:headers) do
      { 'x-api-key' => factory_token, 'Content-Type' => 'application/json' }
    end
    FactoryBot.create(:vessel)
    vessel = FactoryBot.build(:vessel)
    post_vessel = {
      name: vessel.name,
      owner_id: vessel.owner_id,
      naccs_code: vessel.naccs_code
    }
  end
end
