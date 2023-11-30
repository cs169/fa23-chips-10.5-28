# frozen_string_literal: true

require 'rails_helper'

describe RepresentativesController do
  describe 'Showing a representative profile page' do
    it 'calls the model for the right representative' do
      rep = instance_double(Representative)

      allow(Representative).to receive(:find).and_return(rep)
      allow(rep).to receive(:ocdid).and_return('1')
      get :show, params: { id: 1 }
      expect(rep).to have_received(:ocdid)
    end
  end
end
