# frozen_string_literal: true

# spec/models/state_spec.rb

require 'rails_helper'

RSpec.describe State, type: :model do
  describe 'check for standardized fips code calling std_fips_code' do
    # using factory again since created for application_helper
    let(:state) { create(:state, fips_code: 6) }

    it 'returns a standardized FIPS code' do
      expect(state.std_fips_code).to eq('06')
    end
  end
end
