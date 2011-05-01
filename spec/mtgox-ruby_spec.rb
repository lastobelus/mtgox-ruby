$: << File.join(File.dirname(__FILE__), '..', 'lib')
require 'mtgox-ruby'

describe MtgoxClient do

	before :each do
		@mtgox_client = MtgoxClient.new
	end

	it "should be a MtgoxClient" do
		@mtgox_client.should be_a(MtgoxClient)
	end

end
