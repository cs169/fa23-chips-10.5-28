# frozen_string_literal: true

class RepresentativesController < ApplicationController
  def index
    @representatives = Representative.all
  end

  def show
    @representative = Representative.find(params[:id])

    @ocdid_state = nil
    state = @representative.ocdid.match(/state:(\w{2})/)
    if !state.nil?
      @ocdid_state = state.captures[0].upcase
    end

    @default_photo = "https://twirpz.files.wordpress.com/2015/06/twitter-avi-gender-balanced-figure.png"
  end 
end
