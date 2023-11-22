# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'Search for invalid addresses' do
    before do
      @service_instance = instance_double(Google::Apis::CivicinfoV2::CivicInfoService)
      allow(@service_instance).to receive(:key=)
      allow(@service_instance).to receive(:representative_info_by_address).and_return(nil)
      allow(Google::Apis::CivicinfoV2::CivicInfoService).to receive(:new).and_return(@service_instance)
    end

    it 'renders to representatives index with error message' do
      post :search, params: { address: 'England' }
      expect(flash[:error]).to be_present
      expect(response).to redirect_to('/representatives')
    end
  end

  describe 'Search with valid address' do
    it 'renders to search results correctly' do
      post :search, params: { address: 'California' }
      expect(response).to render_template('representatives/search')
    end
  end

  describe 'Search with API error' do
    before do
      @service_instance = instance_double(Google::Apis::CivicinfoV2::CivicInfoService)
      @error = Google::Apis::ClientError.new('Google API Error')
      allow(@service_instance).to receive(:key=)
      allow(@service_instance).to receive(:representative_info_by_address).and_raise(@error)
      allow(Google::Apis::CivicinfoV2::CivicInfoService).to receive(:new).and_return(@service_instance)
    end

    it 'renders to representatives index with error message' do
      post :search, params: { address: 'England' }
      expect(flash[:error]).to be_present
      expect(response).to redirect_to('/representatives')
    end
  end
end
