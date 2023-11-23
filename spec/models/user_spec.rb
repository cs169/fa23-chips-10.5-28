# frozen_string_literal: true

# needed to create more factory for the users

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'calling the name' do
    it 'returns the concatenated first name and last name' do
      user = create(:user, first_name: 'Blake', last_name: 'Cavedo')
      expect(user.name).to eq('Blake Cavedo')
    end
  end

  describe 'calling the auth_provider' do
    it 'returns the correct authentication provider name' do
      user1 = create(:user, provider: :google_oauth2)
      user2 = create(:user, provider: :github)
      expect(user1.auth_provider).to eq('Google')
      expect(user2.auth_provider).to eq('Github')
    end
  end

  describe 'calling the find_google_user' do
    it 'finds the user by uid and Google provider' do
      user = create(:user, provider: :google_oauth2, uid: 'google_uid')
      found_user = described_class.find_google_user('google_uid')
      expect(found_user).to eq(user)
    end
  end

  describe 'calling the find_github_user' do
    it 'finds the user by uid and Github provider' do
      user = create(:user, provider: :github, uid: 'github_uid')
      found_user = described_class.find_github_user('github_uid')
      expect(found_user).to eq(user)
    end
  end

  describe 'validate that users are unique' do
    it 'makes sure of the uniqueness of uid within a provider' do
      create(:user, provider: :google_oauth2, uid: 'existing_uid')
      # user = create(:user, provider: :google_oauth2, uid: 'existing_uid')
      user = build(:user, provider: :google_oauth2, uid: 'existing_uid')
      expect(user).not_to be_valid
      expect(user.errors[:uid]).to include('has already been taken')
    end
  end
end
