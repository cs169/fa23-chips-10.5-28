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
  before :each do
    

  end 
	it 'the addr_concatenate helper returns the right value' do
		
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
