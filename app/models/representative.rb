# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      ocdid_temp = ''
      title_temp = ''



      rep_info.offices.each do |office|
        if office.official_indices.include? index
          title_temp = office.name
          ocdid_temp = office.division_id
        end
      end

      address = concatenate_addr(official.address)



      # check if it already exists
      rep = Representative.find_by(name: official.name, ocdid: ocdid_temp,
        title: title_temp)

      if rep.nil?
        rep = Representative.create!({ name: official.name, ocdid: ocdid_temp,
            title: title_temp, address: address, photo: official.photoUrl , party: official.party })
      end

      reps.push(rep)

    end

    reps
  end

  def concatenate_addr(addr)
    res = addr.line1 + ", "

    if !addr.line2.nil?
      res += addr.line2 + ", "
    end 
    if !addr.line3.nil?
      res += addr.line3 + ", "
    end 

    res += addr.city + ", "
    res += addr.state + addr.zip

    res
  end 

end
