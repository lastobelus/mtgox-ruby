class MtgoxOrder
	
		attr_accessor :price, :amount, :time, :order_id, :buy_or_sell
		
		def buy?
			self.buy_or_sell == :buy
		end
		
		def sell?
			self.buy_or_sell == :sell
		end
		
		def self.from_json(json)
			order = self.new
			order.amount = json["amount"].to_f
			order.order_id = json["tid"]
			order.price = json["price"].to_f
			order.time = Time.at(json["date"].to_i) 
			return order
		end
		
end
