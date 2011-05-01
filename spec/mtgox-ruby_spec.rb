$: << File.join(File.dirname(__FILE__), '..', 'lib')
require 'mtgox-ruby'

describe MtgoxClient do

	before :each do
		@mtgox_client = MtgoxClient.new
	end

	it "should receive recent trades data as MtgoxOrder objects" do
		recent_trades = @mtgox_client.recent_trades
		recent_trades.should be_a(Array)
		recent_trades.length.should > 0
		recent_trades.each do |trade|
			trade.should be_a(MtgoxOrder)
			trade.amount.should > 0
		end
	end

end
