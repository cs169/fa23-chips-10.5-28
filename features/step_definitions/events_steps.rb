# frozen_string_literal: true

Given /that there is an event "(.*)"/ do |event|
  State.create({ name: 'CA', symbol: 'CA', fips_code: '5', is_territory: 0,
      lat_min: 4, lat_max: 5, long_min: 5, long_max: 5,
      created_at: Time.zone.now, updated_at: Time.zone.now })
  county = County.create!({ name:       'Alamaba County',
                            state_id:   1,
                            fips_code:  5,
                            fips_class: 'class',
                            created_at: Time.zone.now,
                            updated_at: Time.zone.now })
  Event.create!({
                  name:        event,
                  description: 'Annual pride parade',
                  start_time:  Time.zone.now + 4.weeks,
                  end_time:    Time.zone.now + 4.weeks + 1.hour,
                  county:      county
                })
end
