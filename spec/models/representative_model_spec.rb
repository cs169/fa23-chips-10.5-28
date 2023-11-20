require 'rails_helper'


# if RUBY_VERSION>='2.6.0'
#   if Rails.version < '5'
#     class ActionController::TestResponse < ActionDispatch::TestResponse
#       def recycle!
#         # hack to avoid MonitorMixin double-initialize error:
#         @mon_mutex_owner_object_id = nil
#         @mon_mutex = nil
#         initialize
#       end
#     end
#   else
#     puts "Monkeypatch for ActionController::TestResponse no longer needed"
#   end
# end

describe Representative do
	describe "civic_api_to_representative_params" do
		it "converts officials returned by civic api to Representative objects" do
			#TODO: create mock rep_info object and stub the .officials method 
			# to return array of mock officials objects
			id = 0
			officials_array = []
			offices_array = []
			(1..4).each do |n|
				official_to_append = double("official " + n.to_s)
				officials_array.append(to_append)

				office_to_append = double("office " + n.to_s)
				offices_array.append(office_to_append)
			end

			rep_info_double = double("info")
			allow(rep_info_double).to receive(:officials).and_return(officials_array)
			allow(rep_info_double).to receive(:offices).and_return(offices_array)

			#ASSERT:
			#array size (# of officials == # of representatives)
			result = Representative.civic_api_to_representative_params(rep_info_double)

			expect(result.size).to eq(officials_array.size)
			#return object type -> NON-NULL array of representative objects
		end
	end
	describe "helpers" do
		it 'accurately concatenates the address' do
			addr_double = double('addr')

			allow(addr_double).to receive(:line1) {'1600 Pennsylvania Avenue Northwest'}
			allow(addr_double).to receive(:line2) {nil}
			allow(addr_double).to receive(:line3) {nil}
			allow(addr_double).to receive(:city) {'Washington'}
			allow(addr_double).to receive(:state) {'DC'}
			allow(addr_double).to receive(:zip) {'20500'}

			var = Representative.concatenate_addr([addr_double])

			expect(var).to eq("1600 Pennsylvania Avenue Northwest, Washington, DC 20500" )
		end
	end
end 
