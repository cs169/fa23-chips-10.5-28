require 'rails_helper'

describe MapController do
	describe 'Searching for country representatives' do
		it 'calls the model that retrieves state information' do
			expect(State).to receive(:find_by)
			get :state, params: {:state_symbol => 'CA'}
		end 
	end
end