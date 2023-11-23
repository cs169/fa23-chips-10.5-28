FactoryBot.define do 
	factory :representative do
		name {'First Last'} # default values rating 'PG'
		created_at {DateTime.new(2001,2,3.5)}
		updated_at {DateTime.new(2001,2,3.5)}
		id {1}

	end 
end

