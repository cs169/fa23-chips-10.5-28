require 'rails_helper'

describe RepresentativesController do
	describe 'Showing a representative profile page' do
		it 'calls the model for the right representative' do

			rep = FactoryBot.build(:representative, :name => 'Joe')
			Representative.create!(:name =>"Joe")
			@fake_result = double('representative1')
			expect(Representative).to receive(:find_by).and_return([@fake_result])
			allow(@fake_result).to receive(:ocdid).and_return(1)
			@fake_res2 = double('fake2')
			allow(nil).to receive(:match).and_return(@fake_res2)

			allow(@fake_res2).to receive(:captures).and_return(['CA'])
			
			
			# allow_any_instance_of(String).to receive(:captures).and_return(['CA'])
			
			
			get :show, params: {:id => 1}

		end
	end


end