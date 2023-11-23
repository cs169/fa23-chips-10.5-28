require 'rails_helper'

describe RepresentativesController do
	describe 'Showing a representative profile page' do
		it 'calls the model for the right representative' do
			rep = double("rep1")

			expect(Representative).to receive(:find).and_return(rep)
			expect(rep).to receive(:ocdid).and_return("1")
			get :show, params: {:id => 1 }
		end
	end


end