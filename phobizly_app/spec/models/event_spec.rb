require 'rails_helper'

RSpec.describe Event, :type => :model do
	it { should belong_to(:client) 			 	}
	it { should validate_presence_of(:type) 	}
	it { should validate_presence_of(:location) }
	it { should have_many(:photos) }
	it { should validate_presence_of(:name) }

	
end
