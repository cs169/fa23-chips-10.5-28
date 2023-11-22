# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'function state_ids_by_name should return a hash' do
    before do
      create(:state, name: 'California', fips_code: 1)
      create(:state, name: 'New York', fips_code: 2)
    end

    it 'returns a hash of state names to their IDs' do
      result = { 'California' => 1, 'New York' => 2 }
      expect(described_class.state_ids_by_name).to eq(result)
    end
  end

  describe 'function state_symbols_by_name should return a hash' do
    before do
      create(:state, name: 'California', symbol: 'CA')
      create(:state, name: 'Florida', symbol: 'FL')
    end

    it 'returns a hash of state names to their symbols' do
      result = { 'California' => 'CA', 'Florida' => 'FL' }
      expect(described_class.state_symbols_by_name).to eq(result)
    end
  end

  describe 'unction nav_items should return an array' do
    before do
      @home_link = { title: 'Home', link: '/' }
      @events_link = { title: 'Events', link: '/events' }
      @reps_link = { title: 'Representatives', link: '/representatives' }
    end

    it 'returns an array of navigation items' do
      nav_items = described_class.nav_items
      expect(nav_items.length).to eq(3)
      expect(nav_items).to include(@home_link, @events_link, @reps_link)
    end
  end

  describe 'unction active should return an array' do
    it 'returns "bg-primary-active" when the controller matches the navigation link' do
      allow(Rails.application.routes).to receive(:recognize_path)
        .with('/events', method: :get).and_return(controller: 'events')
      active_class = described_class.active('events', '/events')
      expect(active_class).to eq('bg-primary-active')
    end

    it 'returns an empty string when the controller does not match the navigation link' do
      allow(Rails.application.routes).to receive(:recognize_path)
        .with('/events', method: :get).and_return(controller: 'other')
      active_class = described_class.active('events', '/events')
      expect(active_class).to eq('')
    end
  end
end
