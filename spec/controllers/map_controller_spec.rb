require 'rails_helper'

describe MapController do
	describe 'Searching for country representatives' do
		it 'calls the model that retrieves state information' do
			expect(State).to receive(:find_by)
			get :state, params: {:state_symbol => 'CA'}
		end 
	end
	describe 'Improper search' do
		it 'tries to call a nonexisitent state' do
			expect(State).to receive(:find_by).and_return(nil)
			# expect_any_instance_of(MapController).to receive(:handle_state_not_found)
			get :state, params: {:state_symbol => 'AA'}
		end
	end

end