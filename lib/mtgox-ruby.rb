class MtgoxClient

  def initialize
  end
	
  def ticket_data
    raise "implement me"
  end
	
  def market_depth
    raise "implement me"
  end
	
  def recent_trades
    raise "implement me"
  end
	
  def current_balance
    raise "implement me"
  end
  
  def open_orders
    raise "implement me"
  end
  
  def cancel_order(order_id, buy_or_sell)
    raise "implement me"
  end
  
  def place_order(amount, price, buy_or_sell)
    raise "implement me"
  end  
  
  def send_bitcoin(amount, bitcoin_address)
    raise "implement me"
  end
  
private
  
  def place_buy_order(amount, price)
    raise "implement me"
  end
  
  def place_sell_order(amount, price)
    raise "implement me"
  end

end
