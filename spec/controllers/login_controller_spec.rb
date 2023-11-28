# frozen_string_literal: true

# Uses User Factory
# 'create_session' and 'find_or_create_user' still need to be done

require 'rails_helper'

RSpec.describe LoginController, type: :controller do
  describe 'User logging in' do
    it 'login view is rendered' do
      get :login
      expect(response).to render_template(:login)
    end
  end

  describe 'creating a google user' do
    before do
      @user_info = {
        'uid'  => '0',
        'info' => { 'first_name' => 'Blake',
        'last_name' => 'Cavedo', 'email' => 'blakecavedo@berkeley.edu' }
      }
    end

    it 'creates a new user based on the info provided by google' do
      expect { controller.send(:create_google_user, @user_info) }.to change(User, :count).by(1)
    end
  end

  describe 'creating a github user' do
    before do
      @user_info = {
        'uid'  => '0',
        'info' => { 'first_name' => 'Blake',
        'last_name' => 'Cavedo', 'email' => 'blakecavedo@berkeley.edu' }
      }
    end

    it 'creates a new user based on the info provided by github' do
      expect { controller.send(:create_github_user, @user_info) }.to change(User, :count).by(1)
    end
  end

  describe 'user logging out' do
    it 'sessions get cleared and root path is rendered' do
      get :logout
      expect(session[:current_user_id]).to be_nil
      expect(response).to redirect_to('/')
      expect(flash[:notice]).to eq('You have successfully logged out.')
    end
  end

  describe 'user has already logged in' do
    it 'goes to user profile since user has session already' do
      # need to reset the session
      session[:current_user_id] = 0
      get :login
      expect(response).to redirect_to('/user/profile')
    end
  end

  describe 'find or create user' do
    it 'does not find a Google user, so it creates a new Google user' do
      @user_info = {
        'uid'      => '0',
        'info'     => { 'first_name' => 'Blake',
        'last_name' => 'Cavedo', 'email' => 'blakecavedo@berkeley.edu' },
        'provider' => :google_oauth2
      }
      expect { controller.send(:find_or_create_user, @user_info, :create_google_user) }.to change(User, :count).by(1)
    end
  end
end
