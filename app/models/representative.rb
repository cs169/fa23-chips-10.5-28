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

      # address = self.concatenate_addr(official.address)

			photo_url = 'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg'
			
			# if official.has_key?("photoUrl")
			# 	photo_url = official.photoUrl 
			# end

      # check if it already exists
      rep = Representative.find_by(name: official.name, ocdid: ocdid_temp,
        title: title_temp)

			puts official

      if rep.nil?
        rep = Representative.create!({ name: official.name, ocdid: ocdid_temp,
            title: title_temp, address: "yeah", photo: photo_url , party: official.party })

      end

      reps.push(rep)

    end

    reps
  end

  def self.concatenate_addr(addr)
    res = addr[0].line1 + ", "

    if !addr[0].line2.nil?
      res += addr[0].line2 + ", "
    end 
    if !addr[0].line3.nil?
      res += addr[0].line3 + ", "
    end 

    res += addr[0].city + ", "
    res += addr[0].state + " " + addr[0].zip

    res
  end 

end
