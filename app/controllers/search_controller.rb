# frozen_string_literal: true

require 'google/apis/civicinfo_v2'

class SearchController < ApplicationController
  def search
    address = params[:address]
    service = Google::Apis::CivicinfoV2::CivicInfoService.new
    service.key = Rails.application.credentials[:GOOGLE_API_KEY]
    begin
      result = service.representative_info_by_address(address: address)
      if result.nil? || result.officials.empty?
        flash[:error] = 'No representatives found for the provided address.'
        redirect_to '/representatives'
      else
        @representatives = Representative.civic_api_to_representative_params(result)
        render '/representatives/search'
      end
    rescue Google::Apis::ClientError
      flash[:error] = 'Invalid Search.'
      redirect_to '/representatives'
    end
  end
end
