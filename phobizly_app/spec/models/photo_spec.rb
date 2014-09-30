require 'rails_helper'

RSpec.describe Photo, :type => :model do
	it { should belong_to(:events) 			 		}
	it { should validate_presence_of(:file_name) 	}
	it { should validate_uniqueness_of(:file_name) 	}

end
